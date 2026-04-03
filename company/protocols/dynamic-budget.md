# 💶 Sistema de Presupuesto Dinámico

> Los límites de inversión autónoma NO están hardcodeados en los agentes.
> Se almacenan en Supabase y el Board Member los ajusta en tiempo real via Telegram.

---

## Arquitectura

```
Dr. Sergio (Telegram)
    │
    │ /budget set autonomous_limit 500
    │ /budget set agent_max 80
    │ /budget set monthly_cap 3000
    │
    ▼
n8n webhook → Supabase shared.budget_config UPDATE
    │
    ▼
Todos los agentes consultan shared.budget_config
ANTES de cada decisión de gasto
```

---

## Tabla Supabase: shared.budget_config

```sql
CREATE TABLE shared.budget_config (
  key TEXT PRIMARY KEY,
  value DECIMAL NOT NULL,
  description TEXT,
  updated_at TIMESTAMPTZ DEFAULT now(),
  updated_by TEXT DEFAULT 'board_member'
);

-- Valores iniciales (ajustables en cualquier momento)
INSERT INTO shared.budget_config (key, value, description) VALUES
  -- Límites de decisión autónoma
  ('autonomous_limit', 500, 'Máximo que el CEO Agent puede aprobar sin escalar al Board Member (€/decisión)'),
  ('agent_approval_limit', 100, 'Máximo que un agente sub-CEO puede gastar sin aprobación del CEO Agent (€/decisión)'),
  
  -- Caps mensuales
  ('monthly_total_cap', 5000, 'Gasto máximo total del portfolio por mes (€). Si se alcanza: PAUSAR todo excepto MediAI.'),
  ('monthly_per_business_cap', 500, 'Gasto máximo por negocio individual por mes (€)'),
  ('monthly_per_agent_cap', 150, 'Gasto máximo por agente individual por mes (€)'),
  
  -- Alertas
  ('alert_threshold_pct', 80, 'Porcentaje del cap al que Minerva envía alerta temprana (%)'),
  ('emergency_pause_pct', 95, 'Porcentaje del cap al que Minerva pausa automáticamente (%)'),
  
  -- Revenue-based scaling
  ('reinvestment_ratio', 0.10, 'Ratio de revenue que se puede reinvertir en crecimiento (10% por defecto)'),
  ('min_profit_margin', 0.60, 'Margen mínimo de beneficio antes de permitir gastos discrecionales (60%)');

-- Index para queries rápidas
CREATE INDEX idx_budget_config_key ON shared.budget_config(key);
```

---

## Reglas de decisión actualizadas

### Flujo de aprobación dinámico

```
Agente necesita gastar €X
         │
         ▼
Consultar shared.budget_config
         │
    ┌────▼────────────────────────────┐
    │ ¿X ≤ agent_approval_limit?      │
    │ (default: €100)                 │
    ├────┬────────────────────────────┤
    │   SÍ                            │
    │    → Ejecutar directamente      │
    │    → Log en Paperclip           │
    │                                 │
    │   NO                            │
    │    ▼                            │
    │ ¿X ≤ autonomous_limit?          │
    │ (default: €500)                 │
    ├────┬────────────────────────────┤
    │   SÍ                            │
    │    → CEO Atlas evalúa y aprueba │
    │    → Log con justificación      │
    │                                 │
    │   NO                            │
    │    → CEO Atlas prepara brief    │
    │    → Telegram al Board Member   │
    │    → ESPERAR aprobación         │
    └─────────────────────────────────┘
```

### Caps mensuales (Minerva monitorea)

```
Cada heartbeat de Minerva (cada 24h):
    │
    ├─ Calcular gasto acumulado del mes por agente
    │   → Si agente alcanza alert_threshold_pct (80%) de su cap:
    │     → Ticket informativo a CEO Atlas
    │
    ├─ Calcular gasto acumulado del mes por negocio
    │   → Si negocio alcanza emergency_pause_pct (95%) de su cap:
    │     → PAUSAR agentes no-críticos de ese negocio
    │     → Ticket P1 a Atlas
    │
    ├─ Calcular gasto acumulado total del portfolio
    │   → Si total alcanza emergency_pause_pct de monthly_total_cap:
    │     → PAUSAR TODO excepto MediAI Clinical Agent y DevOps Hephaestus
    │     → Alerta P0 a Atlas + Board Member
    │
    └─ Revenue-based scaling check:
        → Si revenue del mes × reinvestment_ratio > gasto actual:
          → "Hay margen para invertir más" → informar a Atlas
        → Si profit_margin < min_profit_margin:
          → "Margen bajo, recortar gastos" → P1 a Atlas
```

---

## Comandos Telegram del Board Member

El Board Member controla los presupuestos desde Telegram con estos comandos al bot `@nexthorizont_ceo_bot`:

### Ver configuración actual
```
/budget status
```
→ Respuesta:
```
💶 BUDGET CONFIG — NextHorizont AI

Límites de decisión:
├─ Agente solo decide: ≤ €100
├─ Atlas decide: ≤ €500
└─ Board aprueba: > €500

Caps mensuales:
├─ Total portfolio: €5,000
├─ Por negocio: €500
└─ Por agente: €150

Alertas:
├─ Alerta temprana: al 80%
└─ Pausa automática: al 95%

Scaling:
├─ Reinversión: 10% del revenue
└─ Margen mínimo: 60%

Gasto actual del mes: €1,234 / €5,000 (25%)
```

### Cambiar un límite
```
/budget set autonomous_limit 300
/budget set monthly_total_cap 8000
/budget set agent_approval_limit 50
/budget set reinvestment_ratio 0.15
```
→ Respuesta:
```
✅ autonomous_limit actualizado: €500 → €300
Efectivo inmediatamente. Todos los agentes verán el cambio en su próximo heartbeat.
```

### Modo emergencia
```
/budget freeze
```
→ PAUSA todos los gastos discrecionales inmediatamente. Solo operan:
- MediAI Clinical Agent (no se puede pausar por seguridad)
- DevOps Hephaestus (mantiene infraestructura)
- Telegram Agents (envían contenido ya generado)

```
/budget unfreeze
```
→ Restaura operación normal.

### Escalar presupuesto rápido
```
/budget scale up 2x
```
→ Multiplica TODOS los caps ×2 (para meses de lanzamiento agresivo)

```
/budget scale down 0.5x
```
→ Reduce todos los caps al 50% (para meses de austeridad)

---

## Workflow n8n para comandos Telegram

```
Trigger: Telegram Bot webhook (message from Board Member chat_id ONLY)
  │
  ├─ Code Node: parsear comando /budget [action] [key] [value]
  │
  ├─ IF action == "status":
  │   → Supabase: SELECT * FROM shared.budget_config
  │   → Supabase: SELECT SUM(token_cost_day) FROM shared.financial_dashboard WHERE month = current
  │   → Format: mensaje bonito con emojis
  │   → Telegram: responder
  │
  ├─ IF action == "set":
  │   → Supabase: UPDATE shared.budget_config SET value = [value] WHERE key = [key]
  │   → Supabase: INSERT INTO shared.audit_log (action: 'budget_change', details: ...)
  │   → Telegram: confirmar cambio
  │
  ├─ IF action == "freeze":
  │   → Supabase: UPDATE shared.budget_config SET value = 0 WHERE key = 'monthly_total_cap'
  │   → Paperclip API: pausar agentes no-esenciales
  │   → Telegram: "🔒 Budget CONGELADO. Solo MediAI + DevOps operativos."
  │
  ├─ IF action == "unfreeze":
  │   → Supabase: restaurar valores previos (del audit_log)
  │   → Paperclip API: reactivar agentes
  │   → Telegram: "🔓 Budget restaurado. Operación normal."
  │
  └─ IF action == "scale":
      → Supabase: UPDATE shared.budget_config SET value = value * [multiplier]
      → Telegram: confirmar nuevos valores
```

### Seguridad del workflow
- **Solo acepta comandos del chat_id del Board Member** (hardcoded en n8n)
- Cada cambio se registra en `shared.audit_log` con timestamp y valor anterior
- Si el Board Member envía un comando inválido → responde con ayuda: "Comandos: /budget status | set | freeze | unfreeze | scale"

---

## Escenarios de ejemplo

### Mes 1 (lanzamiento conservador)
```
/budget set autonomous_limit 200
/budget set monthly_total_cap 2000
/budget set monthly_per_business_cap 300
```
→ Atlas puede gastar hasta €200 por decisión, portfolio no supera €2K/mes.

### Mes 6 (crecimiento agresivo)
```
/budget scale up 2x
```
→ Todos los caps se duplican. Atlas puede gastar hasta €1,000 por decisión.

### Emergencia (revenue cae)
```
/budget freeze
```
→ Solo MediAI y DevOps operan. Revisar situación y decidir.

### Estabilidad (mes 12+)
```
/budget set reinvestment_ratio 0.20
/budget set autonomous_limit 500
/budget set monthly_total_cap 10000
```
→ Se reinvierte el 20% del revenue, Atlas tiene más autonomía.

---

## Agentes afectados por este cambio

| Agente | Cómo usa budget_config |
|--------|----------------------|
| **Atlas (CEO)** | Consulta `autonomous_limit` antes de aprobar gastos |
| **Minerva (CFO)** | Monitorea TODOS los caps, pausa agentes, calcula margen |
| **Apollo (CMO)** | Verifica `monthly_per_business_cap` antes de lanzar campaña |
| **Mercury (Growth)** | Verifica `agent_approval_limit` antes de pagar por backlinks/ads |
| **CEO de negocio** | Consulta `monthly_per_business_cap` para su negocio |
| **Todos los agentes** | Si `monthly_total_cap` alcanzado → se pausan automáticamente |
