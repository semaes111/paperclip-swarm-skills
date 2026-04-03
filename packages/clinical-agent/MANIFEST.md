# Clinical Agent — Skill Package (⚠️ MediAI ONLY)
**Modelo:** Claude Sonnet 4.6 | **Heartbeat:** 1x/usuario/día | **Budget:** €130/mes

## Skills
```bash
# Compliance y seguridad
npx skills add Sushegaad/Claude-Skills-Governance-Risk-and-Compliance
npx skills add wshobson/agents/gdpr-data-handling
# CUSTOM: custom-skills/rgpd-lopd-spain/

# Clinical
# MCP: clinical-decision-support (aimcp.info)
# MCP: medical-treatment-plan-writer (mcpmarket.com)

# Reporting
npx skills add anthropics/skills/pdf    # Informes clínicos
```

## ⚠️ REGLAS DE SEGURIDAD
1. NUNCA da diagnósticos definitivos
2. Alertas críticas: vómitos >48h, taquicardia, dolor abdominal severo → INMEDIATO
3. RLS por patient_id — SOLO accede al paciente en proceso
4. Signed URLs de 1h para PDFs
## Total: 3 externas + 1 custom + 2 MCP | Negocios: MediAI ONLY
