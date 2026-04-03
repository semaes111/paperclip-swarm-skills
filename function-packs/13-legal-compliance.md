# ⚖️ Pack 13: Legal & Compliance

> Instalar cuando un agente necesite verificar GDPR/RGPD, compliance de contenido de apuestas (DGOJ), disclaimers financieros, políticas de privacidad, o auditar cumplimiento normativo.

---

## Qué capacidades da

- GDPR compliance completo (94% accuracy benchmarked)
- RGPD/LOPD-GDD adaptado a España con AEPD
- DGOJ: regulación española de juego para contenido de apuestas
- Contract review y NDA generation
- Compliance audit multi-framework (GDPR, CCPA, PCI-DSS)
- DPIA generator (Evaluación de Impacto, Art. 35 RGPD)
- Data Subject Rights tracker
- Cookie consent management

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Legal Compliance Agent | Global | Audit semanal de compliance |
| CEO Agent Global | Global | Decisiones con implicaciones legales |
| Clinical Agent | MediAI | RGPD datos de salud |
| Pick Agent | BetVIP, Fantasy | Disclaimers DGOJ |
| Signal Agent | TradingAI | Disclaimers CNMV |

## Instalación

```bash
# GDPR/GRC (94% accuracy)
npx skills add Sushegaad/Claude-Skills-Governance-Risk-and-Compliance
npx skills add wshobson/agents/gdpr-data-handling

# Legal assistant (14 skills)
npx skills add zubair-trabzada/ai-legal-claude

# Plugin marketplace (gdpr-dsgvo-expert con 3 Python tools)
# /plugin marketplace add alirezarezvani/claude-skills
# → Activar: gdpr-dsgvo-expert, ra-qm-skills

# CUSTOM: España-específico
cp -r custom-skills/dgoj-compliance/ ~/.claude/skills/user/
cp -r custom-skills/rgpd-lopd-spain/ ~/.claude/skills/user/
```

**Total: 3 npx + 1 plugin + 2 custom skills**

## ⚠️ REGLA CRÍTICA

**Este agente NO ejecuta cambios legales sin aprobación del Board Member (Dr. Sergio).**
Solo genera checklists, audita, y escala.

## Verificación

```
"Genera el checklist mensual de compliance para el portfolio: verifica RGPD en las 10 webs, disclaimers DGOJ en BetVIP/FantasySports, disclaimers financieros en TradingAI, y política de privacidad actualizada"
```

## Dependencias

- Web search para monitoring BOE, DGOJ, AEPD
- Sin dependencias de otros packs

## Cuándo NO instalar

- Content Agents puros (usan los disclaimers, no los auditan)
- Voice/Quiz/Publisher Agents
