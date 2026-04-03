# 🏢 NextHorizont AI — Empresa Autónoma Paperclip

## Blueprint Completo de la Organización

> **Versión:** 1.0 | **Fecha:** Abril 2026
> **Modelo operativo:** Zero-Human Company — supervisada por 1 persona (Dr. Sergio)
> **Objetivo:** €200K MRR en 18 meses con <€10K/mes de costes operativos

---

## Organigrama Completo

```
╔══════════════════════════════════════════════════════════════════════╗
║  👤 BOARD MEMBER — Dr. Sergio                                       ║
║     Aprueba: estrategia trimestral, >€500, nuevas contrataciones    ║
║     Revisa: lunes 09:00 y viernes 17:00 (España)                    ║
║     Canal: Telegram (urgente) + Email (reportes)                     ║
╚═══════════════════════════╤══════════════════════════════════════════╝
                            │
┌───────────────────────────▼───────────────────────────────────────┐
│  🎯 CEO AGENT — "Atlas"                                           │
│  Sonnet 4.6 | Heartbeat 4h | Budget €100/mes                      │
│  Coordina TODO. Reporte semanal. Decisiones tácticas <€200.       │
└──┬──────────┬──────────┬──────────┬──────────┬──────────┬─────────┘
   │          │          │          │          │          │
┌──▼──┐  ┌───▼──┐  ┌───▼───┐  ┌──▼───┐  ┌──▼───┐  ┌──▼──────┐
│ CFO │  │ CMO  │  │ CDO   │  │ CIO  │  │ CLO  │  │ GROWTH  │
│Agent│  │Agent │  │Agent  │  │Agent │  │Agent │  │ Agent   │
└──┬──┘  └──┬───┘  └──┬────┘  └──┬───┘  └──┬───┘  └──┬──────┘
   │        │         │          │         │          │
   │   ┌────▼─────┐   │     ┌───▼────┐    │    ┌────▼──────┐
   │   │Competitor│   │     │DevOps  │    │    │Lead       │
   │   │Tracker   │   │     │Agent   │    │    │Research   │
   │   └──────────┘   │     └────────┘    │    └───────────┘
   │                  │
   │            ┌─────▼──────────────────────────────────────────┐
   │            │         10 SUB-EMPRESAS                         │
   │            │  Cada una con CEO + 4-6 agentes operativos      │
   │            │  OraAI | BetVIP | HechizosAI | TradingAI        │
   │            │  NewsletterAI | NumerologíaAI | CoachingAI       │
   │            │  CursosAI | FantasySports | MediAI               │
   │            └─────────────────────────────────────────────────┘
```

---

## Tabla Completa de Agentes Globales

| # | Agente | Archivo Config | Modelo | Heartbeat | Budget | Función |
|---|--------|---------------|--------|-----------|--------|---------|
| 1 | CEO "Atlas" | `agents/global/01-ceo-atlas.md` | Sonnet 4.6 | 4h | €100 | Orquestación global, reportes, decisiones |
| 2 | CFO "Minerva" | `agents/global/02-cfo-minerva.md` | Kimi K2 | 24h | €40 | P&L, costes tokens, break-even, presupuestos |
| 3 | CMO "Apollo" | `agents/global/03-cmo-apollo.md` | Sonnet 4.6 | 48h | €80 | Estrategia marketing, calendarios, brand |
| 4 | CDO "Hermes" | `agents/global/04-cdo-hermes.md` | Kimi K2 | 6h | €80 | Data intelligence, KPIs, anomalías |
| 5 | CIO "Vulcan" | `agents/global/05-cio-vulcan.md` | Kimi K2 | 12h | €50 | Competitive intel, precios, cambios |
| 6 | CLO "Themis" | `agents/global/06-clo-themis.md` | Sonnet 4.6 | Semanal | €30 | Legal compliance, RGPD, DGOJ |
| 7 | Growth "Mercury" | `agents/global/07-growth-mercury.md` | Kimi K2 | 24h | €50 | Lead research, B2B outreach, backlinks |
| 8 | DevOps "Hephaestus" | `agents/global/08-devops-hephaestus.md` | Haiku 4.5 | 1h | €30 | Uptime, deploys, n8n, infra |

**Total agentes globales: 8**
**Budget global mensual: €460**

---

## Tabla Completa de Agentes por Negocio

Cada negocio tiene 4-6 agentes. Se multiplica × 10 negocios = **~50 agentes operativos**.

Ver `agents/per-business/` para configuraciones completas por negocio.

---

## Reglas de Operación Autónoma

### 1. Ciclo de Heartbeat (el pulso de la empresa)

```
00:00 UTC  — DevOps "Hephaestus" verifica uptime de 10 sitios
01:00 UTC  — CIO "Vulcan" rastreo nocturno de competidores
04:00 UTC  — CEO "Atlas" heartbeat: revisa tickets P0/P1 pendientes
06:00 UTC  — Content Agents generan contenido diario (OraAI, BetVIP, etc.)
06:30 UTC  — Publisher Agents despliegan contenido en Vercel
08:00 UTC  — Telegram Agents envían contenido diario a canales
08:00 UTC  — CEO "Atlas" heartbeat: KPIs matutinos
09:00 UTC  — CMO Traffic Agents publican social media
09:00 UTC  — CLO "Themis" (lunes): audit semanal de compliance
12:00 UTC  — CEO "Atlas" heartbeat: estado del portfolio
15:00 UTC  — Growth "Mercury": follow-up leads B2B
16:00 UTC  — CEO "Atlas" heartbeat: cierre de día
18:00 UTC  — CDO "Hermes" heartbeat: métricas del día
20:00 UTC  — CFO "Minerva": P&L diario calculado
22:00 UTC  — CDO "Hermes": anomaly detection overnight
```

### 2. Protocolo de Escalación

```
Nivel 1 (Automático — sin intervención humana):
├─ Tarea operativa <€50 → Ejecutar directamente
├─ Contenido rutinario → Publicar según calendario
├─ Métricas dentro de rango → Log y continuar
└─ Ticket P2/P3 → Resolver en siguiente heartbeat

Nivel 2 (CEO Agent "Atlas" decide):
├─ Gasto €50-€200 → Atlas aprueba sin escalar
├─ Cambio de precio → Atlas evalúa datos CFO + CDO
├─ Activar/pausar campaña → Atlas decide con datos CMO
└─ Ticket P1 → Atlas resuelve en <1h

Nivel 3 (Board Member — Dr. Sergio):
├─ Gasto >€200 → Telegram notification + esperar aprobación
├─ MRR caída >20% en 7 días → Alerta INMEDIATA
├─ Nuevo negocio/contratación → Esperar revisión lunes/viernes
├─ Cambio legal significativo → CLO prepara brief, Board decide
└─ Alerta clínica MediAI → Telegram INMEDIATO 24/7
```

### 3. Protocolo de Comunicación

```
Agente → Agente:    Via ticket system de Paperclip (SIEMPRE)
Agente → Board:     Via Telegram (urgente) o email (reportes)
Board → Agentes:    Via Paperclip dashboard o Telegram reply

Formato de ticket:
{
  "from": "cfo-minerva",
  "to": "ceo-atlas",
  "priority": "P2",
  "subject": "BetVIP token costs at 87% of monthly budget",
  "data": { "current_spend": €52.20, "budget": €60, "projection": €71 },
  "recommended_action": "Migrate Marketing Agent to Haiku 4.5",
  "requires_approval": false
}
```

### 4. Cross-Selling Automatizado

Los Content Agents DEBEN incluir cross-references:
```
OraAI ←→ NumerologíaAI      (astrología + números)
HechizosAI ←→ OraAI          (ritual + contexto astral)
BetVIP ←→ FantasySports      (apuestas + fantasy)
TradingAI ←→ CoachingAI      (trading + psicología)
MediAI ←→ CursosAI           (tratamiento + curso GLP-1)
NewsletterAI → TODOS          (promoción cruzada en cada número)
```

### 5. Métricas de Salud del Swarm

El CDO "Hermes" monitorea estas métricas del propio swarm:

| Métrica | Saludable | Alarma | Acción |
|---------|-----------|--------|--------|
| Uptime agentes | >99% | <95% | Escalar VPS |
| Latencia heartbeat | <30s | >120s | Optimizar queries |
| Token cost / revenue | <5% | >10% | Migrar a modelos baratos |
| Tickets sin resolver >24h | 0 | >5 | CEO Atlas interviene |
| Errores de API | <1% | >5% | DevOps investiga |

---

## Cómo Desplegar

### Paso 1: Instalar Paperclip en VPS
```bash
npx paperclipai onboard --yes
```

### Paso 2: Crear la empresa global
```bash
curl -X POST http://localhost:3100/api/companies \
  -H "Content-Type: application/json" \
  -d '{
    "name": "NextHorizont AI",
    "mission": "Portfolio de 10 negocios digitales autónomos. Objetivo: €200K MRR en 18 meses.",
    "board_member": "Dr. Sergio",
    "contact": "telegram:@drsergiobot"
  }'
```

### Paso 3: Registrar agentes globales
Cargar cada archivo de `agents/global/` como system prompt del agente correspondiente.

### Paso 4: Crear sub-empresas (1 por negocio)
Cargar cada archivo de `agents/per-business/` para cada negocio.

### Paso 5: Configurar n8n workflows
Los Telegram Agents y Publisher Agents operan via n8n HTTP endpoints.

---

## Archivos de Configuración

```
company/
├── BLUEPRINT.md               ← ESTE ARCHIVO
├── agents/
│   ├── global/
│   │   ├── 01-ceo-atlas.md
│   │   ├── 02-cfo-minerva.md
│   │   ├── 03-cmo-apollo.md
│   │   ├── 04-cdo-hermes.md
│   │   ├── 05-cio-vulcan.md
│   │   ├── 06-clo-themis.md
│   │   ├── 07-growth-mercury.md
│   │   └── 08-devops-hephaestus.md
│   └── per-business/
│       ├── oraai-team.md
│       ├── betvip-team.md
│       ├── hechizosai-team.md
│       ├── tradingai-team.md
│       ├── newsletterai-team.md
│       ├── numerologiaai-team.md
│       ├── coachingai-team.md
│       ├── cursosai-team.md
│       ├── fantasysports-team.md
│       └── mediai-team.md
├── workflows/
│   └── daily-operations.md
└── protocols/
    └── escalation-matrix.md
```
