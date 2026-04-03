# 🤖 Pack 15: Orquestación de Agentes (Swarm)

> Instalar en el CEO Agent Global y en los CEO Agents de cada negocio. Proporciona capacidades de coordinación multi-agente, DAG orchestration, y team management.

---

## Qué capacidades da

- DAG-based multi-agent orchestration (spawn N agents en paralelo)
- Task decomposition y dependency graphs
- Team composition patterns y communication protocols
- Parallel feature development con file ownership
- Swarm Mode de Claude Code (TeammateTool, 13 operaciones)
- Overnight autonomous development (6-8h sin supervisión)

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| CEO Agent Global | Global | Coordinar 10 empresas |
| CEO Agent (cada negocio) | TODOS | Coordinar 4-6 sub-agentes |

## Instalación

```bash
# Plugin marketplace con agenthub (DAG orchestration)
# /plugin marketplace add alirezarezvani/claude-skills
# → Activar: agenthub (7 skills: /hub:spawn, /hub:status, /hub:eval, etc.)

# Coordination patterns
npx skills add wshobson/agents/task-coordination-strategies
npx skills add wshobson/agents/team-composition-patterns
npx skills add wshobson/agents/team-communication-protocols
npx skills add wshobson/agents/parallel-feature-development

# Swarm advanced
# git clone https://github.com/ruvnet/ruflo
# → Copiar .claude/skills/swarm-advanced/ a ~/.claude/skills/user/

# Claude Code native Swarm Mode (habilitar con variable de entorno):
# export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1
```

**Total: 4 npx + 1 plugin + 1 env var**

## Verificación

```
"Despliega el plan de lanzamiento de OraAI: coordina Content Agent para generar horóscopo, Publisher Agent para deploy Vercel, Telegram Agent para envío a canal, y Analytics Agent para verificar métricas post-launch"
```

## Dependencias

- **Paperclip** corriendo en VPS como orquestador principal
- Claude Code Swarm Mode habilitado
- Sin dependencias de otros packs funcionales

## Cuándo NO instalar

- Sub-agentes que NO coordinan a otros (Content, Publisher, Telegram, Voice, Quiz, Nutrition)
- Solo CEO Agents y agentes con rol de coordinación
