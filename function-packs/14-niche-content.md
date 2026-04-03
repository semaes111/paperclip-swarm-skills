# ✨ Pack 14: Generación de Contenido de Nicho

> Instalar cuando un Content Agent necesite generar contenido especializado: astrología, numerología, rituales, coaching con memoria, o cursos educativos.

---

## Qué capacidades da

- **Astrología:** Horóscopos diarios, lecturas de tarot, compatibilidad, tránsitos planetarios
- **Numerología:** Cálculos Pitagórico/Caldeo, número de vida, expresión, año personal
- **Rituales:** Generación personalizada según intención, fase lunar, correspondencias
- **Coaching:** Conversaciones con memoria persistente (RAG + pgvector)
- **Cursos:** Módulos educativos, scripts de video, quizzes
- **Audio:** Narración via MiniMax API

## Agentes que lo usan

| Agente | Negocio | Skills del pack |
|--------|---------|----------------|
| Content Agent | OraAI | astrology-content + Astrology MCP |
| Content Agent | NumerologíaAI | numerology-engine |
| Content Agent | HechizosAI | ritual-generator |
| Coaching Agent | CoachingAI | RAG + memory |
| Content Agent | CursosAI | pptx + internal-comms |
| Voice Agent | Varios | n8n → MiniMax API |

## Instalación

### Para OraAI (astrología)
```bash
cp -r custom-skills/astrology-content/ ~/.claude/skills/user/
# MCP Server (opcional, 16 herramientas profesionales):
# Conectar astrology-api.io/p/mcp-astrology en Claude Code
```

### Para NumerologíaAI
```bash
cp -r custom-skills/numerology-engine/ ~/.claude/skills/user/
```

### Para HechizosAI
```bash
cp -r custom-skills/ritual-generator/ ~/.claude/skills/user/
```

### Para CoachingAI (memoria RAG)
```bash
npx skills add wshobson/agents/rag-implementation
npx skills add supabase/agent-skills/supabase-postgres-best-practices
# Plugin marketplace para agent memory:
# /plugin marketplace add jeremylongshore/claude-code-plugins-plus-skills
# → Activar: domain-memory-agent, lumera-agent-memory
```

### Para CursosAI
```bash
npx skills add anthropics/skills/pptx
npx skills add anthropics/skills/pdf
npx skills add anthropics/skills/internal-comms
```

### Para Newsletter
```bash
npx skills add coreyhaines31/marketingskills/email-sequence
npx skills add anthropics/skills/internal-comms
```

**Total: Depende del negocio — instalar solo lo necesario**

## Verificación (ejemplo OraAI)

```
"Genera el horóscopo diario para Aries con: energía general, área destacada (amor), consejo específico, número de la suerte, y cross-sell de NumerologíaAI"
```

## Dependencias por nicho

| Nicho | API externa | Pack requerido |
|-------|-----------|----------------|
| Astrología | astrology-api.io (MCP) | Ninguno |
| Numerología | Ninguna | Ninguno |
| Rituales | MiniMax API (audio) | Pack 07 (n8n) |
| Coaching | Supabase pgvector | Pack 07 (DevOps) |
| Cursos | MiniMax API (audio) | Pack 07 (n8n) |
| Newsletter | Resend API + Beehiiv | Pack 07 (n8n) |

## Cuándo NO instalar

- Instalar SOLO las sub-secciones del nicho correspondiente
- NO instalar astrología para BetVIP, ni trading para OraAI, etc.
