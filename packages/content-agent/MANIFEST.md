# Content Agent — Skill Package
**Rol:** Generación de contenido especializado por nicho.
**Modelo:** Claude Sonnet 4.6 | **Heartbeat:** varía | **Budget:** €60-130/mes

## Skills base (todos los Content Agents)
```bash
npx skills add coreyhaines31/marketingskills/copywriting
npx skills add coreyhaines31/marketingskills/content-strategy
npx skills add anthropics/skills/pdf        # Generación PDF
npx skills add anthropics/skills/docx       # Documentos
```

## Skills por negocio específico

### OraAI (astrología/tarot)
```bash
# CUSTOM: custom-skills/astrology-content/
# MCP: astrology-api.io/p/mcp-astrology (16 herramientas: natal, transit, synastry)
```

### HechizosAI (rituales)
```bash
# CUSTOM: custom-skills/ritual-generator/
```

### NumerologíaAI
```bash
# CUSTOM: custom-skills/numerology-engine/
```

### NewsletterAI
```bash
npx skills add coreyhaines31/marketingskills/email-sequence  # Drip campaigns Resend
npx skills add anthropics/skills/internal-comms              # Newsletter formatting
```

### CursosAI
```bash
npx skills add anthropics/skills/pptx    # Slides de módulos
# CUSTOM: Quiz generation via Kimi K2 (quiz-agent)
```

### MediAI
```bash
# → Usa clinical-agent package (ver packages/clinical-agent/)
```

### CoachingAI
```bash
# → Usa coaching-agent package (ver packages/coaching-agent/)
```
## Total: 4 base + 2-4 por nicho | Negocios: TODOS
