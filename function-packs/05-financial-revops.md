# 💰 Pack 05: Financial & RevOps

> Instalar cuando un agente necesite calcular unit economics (CAC/LTV/churn), P&L, revenue forecasting, presupuestos, o monitorear costes de tokens/APIs.

---

## Qué capacidades da

- Unit economics: CAC, LTV, payback period, LTV:CAC ratio
- MRR decomposition: new + expansion - contraction - churned
- Revenue forecasting (3-5 year models)
- P&L semanal/mensual automatizado
- Burn rate calculator y runway estimation
- Rule of 40, Quick Ratio, Net Revenue Retention
- KPI dashboards design
- Charlie Munger frameworks de capital allocation

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Financial Control Agent | Global | P&L, costes, break-even |
| CEO Agent Global | Global | Reporting semanal |
| Data Intelligence Agent | Global | KPIs diarios |
| CEO Agent (negocio) | TODOS | MRR y churn por negocio |

## Instalación

```bash
# Métricas y modelado
npx skills add wshobson/agents/startup-metrics-framework
npx skills add wshobson/agents/startup-financial-modeling
npx skills add wshobson/agents/kpi-dashboard-design
npx skills add EveryInc/charlie-cfo-skill

# Plugin marketplace (incluye finance-skills, saas-metrics-coach, cfo-advisor)
# Ejecutar en Claude Code:
# /plugin marketplace add alirezarezvani/claude-skills
# → Activar: finance-skills, saas-metrics-coach, c-level-skills

# Spreadsheets
npx skills add anthropics/skills/xlsx
```

**Total: 5 npx + plugin marketplace**

## Verificación

```
"Calcula el P&L del portfolio NextHorizont para este mes: MRR €33,630, costes tokens €1,200, APIs €160, infra €81. Desglosa unit economics por negocio."
```

## Dependencias

- **Stripe API** para datos de revenue en tiempo real
- **Supabase** schema shared.financial_dashboard
- Ningún otro pack funcional requerido

## Cuándo NO instalar

- Content Agents (no necesitan finanzas)
- Telegram Agents, Publisher Agents
- Voice/Quiz Agents
