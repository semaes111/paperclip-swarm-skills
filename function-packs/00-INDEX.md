# 📦 Function Packs — Índice y Guía de Uso

> **Regla de oro:** Instalar SOLO los packs que necesita cada agente. No cargar todo de golpe.

---

## Mapa rápido: ¿Qué pack necesita mi agente?

| Pack | Archivo | Skills | Para qué agentes |
|------|---------|--------|-------------------|
| 01 | [01-seo-visibility.md](01-seo-visibility.md) | 10 | CMO Traffic, Competitive Intel |
| 02 | [02-cro-conversion.md](02-cro-conversion.md) | 8 | Marketing Strategy, Analytics, CMO |
| 03 | [03-marketing-growth.md](03-marketing-growth.md) | 14 | Marketing Strategy, CMO, Content, Lead |
| 04 | [04-competitive-intelligence.md](04-competitive-intelligence.md) | 7 | Competitive Intel, CEO |
| 05 | [05-financial-revops.md](05-financial-revops.md) | 5+ | Financial Control, CEO, Data Intel |
| 06 | [06-payments-billing.md](06-payments-billing.md) | 5 | Financial Control, Telegram, Publisher |
| 07 | [07-devops-infrastructure.md](07-devops-infrastructure.md) | 4+ | Publisher, Telegram, CEO, Data Intel |
| 08 | [08-telegram-messaging.md](08-telegram-messaging.md) | 2+1c | Telegram, Support, Alert, Checkin |
| 09 | [09-sports-betting.md](09-sports-betting.md) | 3+1c | Quant, Pick (BetVIP/Fantasy ONLY) |
| 10 | [10-trading-crypto.md](10-trading-crypto.md) | 3+1 | Quant, Signal (TradingAI ONLY) |
| 11 | [11-medical-clinical.md](11-medical-clinical.md) | 3+1c | Clinical, Nutrition, Report (MediAI ONLY) |
| 12 | [12-data-analytics.md](12-data-analytics.md) | 4 | Data Intel, Analytics, Quant, Financial |
| 13 | [13-legal-compliance.md](13-legal-compliance.md) | 3+2c | Legal Compliance, CEO |
| 14 | [14-niche-content.md](14-niche-content.md) | Varía | Content Agents (por nicho) |
| 15 | [15-agent-orchestration.md](15-agent-orchestration.md) | 4+ | CEO Agents ONLY |

**c = custom skill de este repo**

---

## Matriz: Agente × Packs necesarios

| Agente | 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 | 10 | 11 | 12 | 13 | 14 | 15 |
|--------|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| **CEO Agent Global** | | | | ● | ● | | | | | | | | ● | | ● |
| **CEO Agent (negocio)** | | ● | | | ● | | | | | | | | | | ● |
| **Data Intelligence** | | | | | ● | | ● | | | | | ● | | | |
| **Competitive Intel** | ● | | | ● | | | | | | | | | | | |
| **Marketing Strategy** | | ● | ● | | | | | | | | | | | | |
| **Lead Research** | ● | | ● | | | | | | | | | | | | |
| **Legal Compliance** | | | | | | | | | | | | | ● | | |
| **Financial Control** | | | | | ● | ● | | | | | | ● | | | |
| **Content Agent** | | | ● | | | | | | | | | | | ● | |
| **CMO Traffic** | ● | ● | ● | | | | | | | | | | | | |
| **Publisher Agent** | | | | | | | ● | | | | | | | | |
| **Telegram Agent** | | | | | | ● | ● | ● | | | | | | | |
| **Analytics Agent** | ● | ● | | | | | | | | | | ● | | | |
| **Quant Agent (BetVIP)** | | | | | | | | | ● | | | ● | | | |
| **Quant Agent (Trading)** | | | | | | | | | | ● | | ● | | | |
| **Pick Agent** | | | ● | | | | | | ● | | | | | | |
| **Signal Agent** | | | ● | | | | | | | ● | | | | | |
| **Clinical Agent** | | | | | | | | | | | ● | | ● | | |
| **Nutrition Agent** | | | | | | | | | | | ● | ● | | | |
| **Coaching Agent** | | | | | | | | | | | | | | ● | |
| **Voice Agent** | | | | | | | ● | | | | | | | | |
| **Quiz Agent** | | | | | | | | | | | | ● | | | |

---

## Ejemplo: Configurar BetVIP desde cero

```bash
# BetVIP tiene 6 agentes: CEO, Quant, Pick, Telegram, Marketing, Tracker

# CEO Agent BetVIP:
# → Pack 02 (CRO) + Pack 05 (Financial) + Pack 15 (Orchestration)

# Quant Agent:
# → Pack 09 (Sports) + Pack 12 (Data Analytics)

# Pick Agent:
# → Pack 03 (Marketing/copywriting) + Pack 09 (Sports)

# Telegram Agent:
# → Pack 06 (Payments) + Pack 07 (DevOps/n8n) + Pack 08 (Telegram)

# Marketing Agent:
# → Pack 01 (SEO) + Pack 02 (CRO) + Pack 03 (Marketing)

# Legal overlay (aplica a todos):
# → Pack 13 (Legal) — solo el custom skill dgoj-compliance
```

## Ejemplo: Configurar MediAI desde cero

```bash
# MediAI tiene 6 agentes: CEO, Clinical, Nutrition, Support, Alert, Report

# CEO Agent MediAI:
# → Pack 05 (Financial) + Pack 15 (Orchestration)

# Clinical Agent:
# → Pack 11 (Medical) + Pack 13 (Legal/RGPD)

# Nutrition Agent:
# → Pack 11 (Medical) + Pack 12 (Data Analytics)

# Support + Alert Agents:
# → Pack 08 (Telegram)

# Report Agent:
# → Pack 11 (Medical) — usa PDF generation
```

---

## Nota sobre deduplicación

Algunos skills aparecen en múltiples packs (ej: `copywriting` está en Pack 02 y Pack 03). **Si ya instalaste un skill en un pack anterior, no necesitas reinstalarlo.** `npx skills add` es idempotente — no duplica skills ya instalados.
