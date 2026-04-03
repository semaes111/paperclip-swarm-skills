# 🕵️ Pack 04: Inteligencia Competitiva

> Instalar cuando un agente necesite monitorear competidores, comparar pricing, detectar cambios en webs rivales, o analizar gaps de contenido/features.

---

## Qué capacidades da

- Análisis competitivo dimensional (producto, digital, SEO, pricing, UX, brand)
- Feature comparison matrix y positioning maps
- Gap analysis: keywords, contenido, features, precio
- Porter's Five Forces adaptado a digital
- Battle cards para ventas
- Web scraping de competidores
- Monitoring de cambios en pricing/features

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Competitive Intel Agent | Global | Monitoring 24h de 10+ competidores |
| CEO Agent | TODOS | Decisiones estratégicas |
| Marketing Strategy Agent | Global | Diferenciación y positioning |

## Instalación

```bash
# Análisis competitivo
npx skills add coreyhaines31/marketingskills/competitor-alternatives
npx skills add wshobson/agents/competitive-landscape
npx skills add aaron-he-zhu/seo-geo-claude-skills/competitor-analysis
npx skills add aaron-he-zhu/seo-geo-claude-skills/content-gap-analysis

# Scraping y monitoring
npx skills add vercel-labs/agent-browser/agent-browser
npx skills add firecrawl/cli/firecrawl
npx skills add squirrelscan/skills/audit-website
```

**Total: 7 skills**

## Verificación

```
"Analiza los 3 principales competidores de BetVIP (OLBG, Blogabet, Whop tipsters): pricing, features, SEO, y genera una feature matrix con gaps"
```

## Dependencias

- **Pack 01 (SEO)** para SEO competitivo profundo
- **Pack 03 (Marketing)** para interpretar positioning

## Cuándo NO instalar

- Telegram/Publisher Agents (ejecutores, no estrategas)
- Clinical/Nutrition Agents
- Voice/Quiz Agents
