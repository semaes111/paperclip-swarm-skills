# ⚙️ Daily Operations Workflow

## Timeline UTC (ejecutado automáticamente 24/7/365)

```
00:00 ┬─ Hephaestus: uptime check 10 sitios + SSL check mensual
      └─ Hermes: métricas cierre del día → shared.daily_metrics
01:00 ── Vulcan: rastreo nocturno competidores → shared.competitive_intel
04:00 ── Atlas: heartbeat nocturno (tickets P0/P1, agentes caídos)
06:00 ┬─ Cassandra (OraAI): genera 12 horóscopos
      ├─ Circe (HechizosAI): rituales on-request queue
      └─ Archimedes (TradingAI): scan cada 15min desde las 06:00
06:30 ── Publishers: deploy contenido → Supabase + ISR Vercel
07:00 ── Hephaestus: uptime check
08:00 ┬─ Atlas: heartbeat matutino (KPIs, alertas)
      ├─ Telegram Agents: envío contenido diario a canales
      └─ Hermes: heartbeat → métricas matutinas
09:00 ┬─ CMO Traffic Agents: publican social media (TikTok/IG)
      └─ Themis (lunes): audit semanal de compliance
10:00 ── Pythia (BetVIP): análisis partidos del día
12:00 ┬─ Atlas: heartbeat mediodía (estado campañas, tickets P2)
      └─ Hephaestus: uptime check
14:00 ── Hermes: heartbeat → anomaly detection
15:00 ── Mercury: follow-up leads B2B, backlink outreach
16:00 ┬─ Atlas: heartbeat cierre (resumen, agenda mañana)
      └─ Atlas (viernes): genera reporte semanal → Telegram Board Member
18:00 ── Hermes: heartbeat → métricas de cierre
19:00 ── Hephaestus: uptime check
20:00 ┬─ Minerva: P&L diario calculado
      └─ Herald (BetVIP): resultados picks del día en canal free
      └─ Croesus (TradingAI): resultados señales cerradas
22:00 ── Hermes: heartbeat → preparar overnight report
23:00 ── Hephaestus: uptime check + Docker health
```

## Workflows especiales por trigger

### Stripe webhook: nuevo pago
```
Stripe → Edge Function → Supabase (subscription: active) → n8n → Telegram (add to VIP) → Resend (welcome email)
Latencia máxima: <60 segundos end-to-end
```

### Stripe webhook: cancelación
```
Stripe → Edge Function → Supabase (status: cancelled) → n8n (delay 30min) → Telegram (remove from VIP) → Resend (win-back email)
```

### Alerta clínica MediAI
```
Galen detecta síntoma crítico → Alert Agent → Telegram INMEDIATO a Dr. Sergio
NO ESPERA HEARTBEAT. Prioridad P0 absoluta.
```

### Competidor cambia precio
```
Vulcan detecta cambio → ticket P1 a Atlas → Atlas evalúa con Minerva (impacto financiero) → decide ajustar o mantener → si ajuste >€200 impacto: escala a Board
```

### Churn spike detectado
```
Hermes detecta churn >2× normal → ticket P1 a Atlas → Atlas activa:
1. Apollo diseña campaña retención (48h)
2. Telegram Agent envía oferta downsell
3. Email win-back sequence activada
```
