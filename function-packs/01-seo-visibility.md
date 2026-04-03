# 🔍 Pack 01: SEO & Visibilidad Digital

> Paquete funcional independiente. Instalar SOLO cuando un agente necesite capacidades de SEO, auditoría web o visibilidad en buscadores (incluido AI Search).

---

## Qué capacidades da este pack

- Auditoría SEO técnica completa (80+ items con severity scoring)
- SEO on-page: titles, metas, headings, schema, internal linking
- SEO programático: generar cientos de landing pages desde templates
- GEO/AEO: optimización para AI Overviews, ChatGPT, Perplexity
- Arquitectura de sitio: crawl depth, topic clusters, URL structure
- Análisis de backlinks: calidad, toxicidad, oportunidades
- Auditoría integral de sitio (rendimiento, accesibilidad, seguridad + SEO)

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| CMO Traffic Agent | TODOS (10 negocios) | SEO artículos, rankings, keywords |
| Competitive Intel Agent | Global | SEO competitivo, keyword gaps |
| Analytics Agent | OraAI, NewsletterAI | Tracking de keywords, orgánico |

## Instalación

```bash
# ─── Core SEO (coreyhaines31/marketingskills) ───
npx skills add coreyhaines31/marketingskills/seo-audit
npx skills add coreyhaines31/marketingskills/programmatic-seo
npx skills add coreyhaines31/marketingskills/ai-seo
npx skills add coreyhaines31/marketingskills/site-architecture

# ─── SEO avanzado ───
npx skills add aaron-he-zhu/seo-geo-claude-skills    # 20 skills: CORE-EEAT, GEO, 8 idiomas
npx skills add AgriciDaniel/claude-seo                # 19 sub-skills + 12 subagentes + DataForSEO
npx skills add resciencelab/opc-skills                # seo-geo para Generative Engines

# ─── Web audit ───
npx skills add squirrelscan/skills/audit-website      # Audit integral (perf+a11y+security+SEO)
npx skills add vercel-labs/agent-browser/agent-browser # Scraping para auditoría visual
npx skills add firecrawl/cli/firecrawl                # Crawling masivo de sitios
```

**Total: 10 skills / repos**

## Verificación post-instalación

Pide a Claude Code:
```
"Haz una auditoría SEO completa de https://oraai.es"
```
Debería activar `seo-audit` + `audit-website` y devolver un scoring por categoría.

## Dependencias

- **Pack 12 (Data Analytics)** recomendado para procesar exports de Google Search Console
- **DataForSEO API** (€50/mes) necesaria para `AgriciDaniel/claude-seo` completo
- Sin DataForSEO, las auditorías manuales siguen funcionando

## Cuándo NO instalar

- Si el agente solo genera contenido sin responsabilidad SEO
- Si el agente es puramente financiero/clínico/legal
- Telegram Agents y Voice Agents NO necesitan este pack
