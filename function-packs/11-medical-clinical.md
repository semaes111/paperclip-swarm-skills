# 💊 Pack 11: Medical & Clinical AI

> ⚠️ PACK RESTRINGIDO — Solo para agentes de MediAI. Instalar ÚNICAMENTE en Clinical Agent, Nutrition Agent, Report Agent y Alert Agent del negocio MediAI.

---

## Qué capacidades da

- GDPR/RGPD para datos de salud (categoría especial)
- Healthcare compliance: PHI protection, audit logs, encryption
- Clinical decision support (GRADE evidence grading)
- Generación de informes clínicos en PDF
- ISO 13485 y EU MDR compliance (ra-qm-skills)

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Clinical Agent | MediAI ONLY | Interpreta síntomas GLP-1, recomendaciones |
| Nutrition Agent | MediAI ONLY | Plan nutricional personalizado |
| Report Agent | MediAI ONLY | Informe semanal paciente en PDF |
| Alert Agent | MediAI ONLY | Detectar valores críticos |

## Instalación

```bash
# Compliance y seguridad
npx skills add Sushegaad/Claude-Skills-Governance-Risk-and-Compliance
npx skills add wshobson/agents/gdpr-data-handling

# CUSTOM: RGPD español adaptado a salud
cp -r custom-skills/rgpd-lopd-spain/ ~/.claude/skills/user/

# Plugin marketplace (ra-qm-skills: ISO 13485, EU MDR, FDA)
# /plugin marketplace add alirezarezvani/claude-skills
# → Activar: ra-qm-skills

# Documentos
npx skills add anthropics/skills/pdf
```

**Total: 3 npx + 1 custom + 1 plugin**

## ⚠️ REGLAS DE SEGURIDAD NO NEGOCIABLES

1. **NUNCA** dar diagnósticos definitivos — solo recomendaciones
2. Alertas críticas (vómitos >48h, taquicardia, hipoglucemia) → Telegram INMEDIATO al Dr. Sergio
3. RLS por `patient_id` — SOLO acceder al paciente en proceso
4. PDFs con signed URLs de 1h (Supabase Storage)
5. Retención datos: 5 años post-última consulta (Ley 41/2002)

## Verificación

```
"Genera un informe semanal en PDF para un paciente en tratamiento GLP-1 que reporta náuseas leves y pérdida de 2kg esta semana, con recomendaciones de seguimiento"
```

## Dependencias

- **Supabase** schema mediai con RLS activado
- **Pack 13 (Legal)** para RGPD base
- **Sin dependencias de otros packs funcionales**

## Cuándo NO instalar

- TODOS los agentes que NO sean de MediAI
- NUNCA instalar en agentes de otros negocios por seguridad RGPD
