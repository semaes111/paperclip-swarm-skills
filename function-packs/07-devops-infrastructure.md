# 🔧 Pack 07: DevOps & Infraestructura

> Instalar cuando un agente necesite deployer en Vercel, gestionar Supabase (schemas, RLS, migrations), crear workflows n8n, o manejar Docker Compose.

---

## Qué capacidades da

- Deploy automático a Vercel (40+ frameworks detectados)
- React/Next.js best practices (68 reglas de rendimiento)
- Supabase PostgreSQL: RLS policies, migrations, pgvector, Edge Functions
- Docker Compose orchestration, multi-stage builds, security hardening
- n8n workflows: 525+ nodes, 2,653 templates, Code node JS/Python
- GitHub Actions CI/CD
- Monitoring & observability: Prometheus, Grafana, alertas

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Publisher Agent | TODOS | ISR revalidation, deploy Vercel |
| CEO Agent | TODOS | Monitoring uptime |
| Data Intelligence Agent | Global | Queries Supabase |
| Telegram Agent | TODOS | n8n workflows de bots |

## Instalación

```bash
# Vercel (oficial)
npx skills add vercel-labs/agent-skills/deploy-to-vercel
npx skills add vercel-labs/agent-skills/vercel-react-best-practices

# Supabase (oficial)
npx skills add supabase/agent-skills/supabase-postgres-best-practices

# n8n
npx skills add czlonkowski/n8n-skills    # 7 skills complementarias

# Docker (22 skills)
# git clone https://github.com/OpenAEC-Foundation/Docker-Claude-Skill-Package
# cp -r Docker-Claude-Skill-Package/.claude/skills/* ~/.claude/skills/user/

# Monitoring
# npx skills add ahmedasmar/devops-claude-skills  (si disponible)
```

**Total: 4 npx + 1 clone opcional**

## Verificación

```
"Crea un workflow n8n que: recibe webhook Stripe → actualiza suscripción en Supabase schema oraai → envía mensaje Telegram → revalida ISR en Vercel"
```

## Dependencias

- VPS Hostinger con Docker Compose corriendo
- Acceso a Vercel, Supabase, n8n APIs

## Cuándo NO instalar

- Content Agents puros (no despliegan nada)
- Quant Agents (solo procesan datos)
- Marketing Strategy Agent (solo planifica)
