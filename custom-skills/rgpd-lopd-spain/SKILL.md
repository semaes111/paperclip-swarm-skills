---
name: rgpd-lopd-spain
description: "RGPD y LOPD-GDD adaptados a España. Usar cuando cualquier agente maneje datos personales de usuarios españoles: emails, datos de pago, datos de salud (MediAI), historial de conversaciones (CoachingAI). Cubre RGPD (UE) + LOPD-GDD (España) + AEPD."
---
# RGPD + LOPD-GDD — Compliance España

## Marco Legal
- **RGPD** (Reglamento UE 2016/679)
- **LOPD-GDD** (Ley Orgánica 3/2018 de Protección de Datos y Garantía de Derechos Digitales)
- **AEPD** como autoridad de control

## Obligaciones por Tipo de Dato

### Datos básicos (email, nombre) — Todos los negocios
- Base legal: Consentimiento explícito o ejecución de contrato
- Checkbox de aceptación NO premarcado
- Política de privacidad accesible antes del registro
- Derecho de acceso, rectificación, supresión, portabilidad

### Datos de salud (MediAI) — Categoría ESPECIAL
- Base legal: Consentimiento EXPLÍCITO + interés vital del paciente
- Cifrado en reposo y en tránsito OBLIGATORIO
- RLS por patient_id en Supabase (ya implementado)
- DPO (Delegado de Protección de Datos) recomendado si >5,000 pacientes
- DPIA (Evaluación de Impacto) OBLIGATORIA antes de procesar
- Retención máxima: 5 años post-última consulta (Ley 41/2002)

### Datos financieros (Stripe) — Todos los negocios
- PCI DSS compliance delegado a Stripe
- No almacenar números de tarjeta en Supabase NUNCA
- Solo guardar: Stripe customer_id, subscription_id, status

### Datos de comportamiento (analytics) — Todos los negocios
- Banner de cookies con opciones granulares
- Google Analytics: IP anonymization activado
- Consentimiento antes de tracking (no asumido)

## Checklist Mensual para Legal Compliance Agent
1. ¿Políticas de privacidad actualizadas en las 10 webs?
2. ¿Consentimiento explícito antes de cada tipo de procesamiento?
3. ¿Registro de actividades de tratamiento actualizado?
4. ¿Respuesta a solicitudes de derechos ARCO en <30 días?
5. ¿Breach notification plan activo? (72h a AEPD si breach)
6. ¿Contratos con encargados de tratamiento firmados? (Stripe, Supabase, Vercel)
