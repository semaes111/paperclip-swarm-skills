# 🤖 Paperclip Swarm Skills — NextHorizont AI

> Paquetes de skills para configurar los **50+ agentes AI** del swarm Paperclip que opera **10 negocios digitales autónomos**.

[![Agents](https://img.shields.io/badge/agents-50+-purple)]()
[![Businesses](https://img.shields.io/badge/businesses-10-blue)]()
[![Skills](https://img.shields.io/badge/skills-150+-green)]()

---

## Arquitectura del Swarm

```
BOARD MEMBER (Dr. Sergio)
         │
    CEO AGENT GLOBAL ──────────────────────────────────────
    │         │            │              │               │
    ├─ Data Intelligence   ├─ Competitive Intel    ├─ Financial Control
    ├─ Marketing Strategy  ├─ Lead Research        ├─ Legal Compliance
    │
    ├── OraAI (6 agentes)        ├── BetVIP (6 agentes)
    ├── HechizosAI (5 agentes)   ├── TradingAI (5 agentes)
    ├── NewsletterAI (5 agentes) ├── NumerologíaAI (5 agentes)
    ├── CoachingAI (6 agentes)   ├── CursosAI (5 agentes)
    ├── FantasySports (5 agentes)└── MediAI (6 agentes)
```

## Estructura del Repo

```
paperclip-swarm-skills/
├── packages/                    # Skill packages por ROL de agente
│   ├── ceo-agent/              # Skills para CEO Agents (global + negocio)
│   ├── data-intelligence-agent/ # Analytics, KPIs, anomaly detection
│   ├── competitive-intel-agent/ # Competitor monitoring, pricing intel
│   ├── marketing-strategy-agent/# Content strategy, campaigns
│   ├── cmo-traffic-agent/      # SEO, social media, paid ads
│   ├── content-agent/          # Content generation por nicho
│   ├── publisher-agent/        # ISR, deployment, publishing
│   ├── telegram-agent/         # Bot management, subscription gating
│   ├── analytics-agent/        # GA4, A/B testing, conversion
│   ├── quant-data-agent/       # Statistical analysis, modeling
│   ├── pick-agent/             # Sports/trading picks generation
│   ├── signal-agent/           # Trading signal formatting
│   ├── clinical-agent/         # Medical AI (MediAI only)
│   ├── coaching-agent/         # AI coaching with RAG memory
│   └── ... (20 roles total)
│
├── custom-skills/              # SKILL.md propias (gaps del ecosistema)
│   ├── dgoj-compliance/        # Regulación española de juego
│   ├── rgpd-lopd-spain/        # RGPD adaptado a España
│   ├── numerology-engine/      # Motor de cálculos numerológicos
│   ├── astrology-content/      # Generación de contenido astrológico
│   ├── ritual-generator/       # Rituales y hechizos personalizados
│   └── telegram-subscription-gate/ # Gating de acceso Telegram+Stripe
│
├── config/                     # Configuración por negocio
│   ├── oraai/manifest.json     # Qué agentes y skills usa OraAI
│   ├── betvip/manifest.json
│   └── ... (10 negocios + global)
│
├── scripts/
│   ├── install-all.sh          # Instalador todo-en-uno
│   └── install-by-business.sh  # Instalador por negocio
│
└── README.md
```

## Instalación Rápida

```bash
# Clonar
git clone https://github.com/semaes111/paperclip-swarm-skills.git
cd paperclip-swarm-skills

# Instalar TODO
bash scripts/install-all.sh

# O instalar por negocio
bash scripts/install-by-business.sh oraai
bash scripts/install-by-business.sh betvip
```

## Skills por Fuente

| Fuente | Skills | Método de instalación |
|--------|--------|----------------------|
| `anthropics/skills` | 17 | `npx skills add anthropics/skills/[name]` |
| `coreyhaines31/marketingskills` | 21 | `npx skills add coreyhaines31/marketingskills/[name]` |
| `alirezarezvani/claude-skills` | 223+ | `/plugin marketplace add alirezarezvani/claude-skills` |
| `wshobson/agents` | 146 | `npx skills add wshobson/agents/[name]` |
| `jeremylongshore/plugins` | 1,367 | `/plugin marketplace add jeremylongshore/claude-code-plugins-plus-skills` |
| `stripe/ai` | 2 | `npx skills add stripe/ai/[name]` |
| `supabase/agent-skills` | 1 | `npx skills add supabase/agent-skills/[name]` |
| `vercel-labs/agent-skills` | 5 | `npx skills add vercel-labs/agent-skills/[name]` |
| Custom (este repo) | 6 | Copiar a `~/.claude/skills/user/` |
| **TOTAL** | **~180+** | |

## Licencia

MIT — NextHorizont AI SL © 2026
