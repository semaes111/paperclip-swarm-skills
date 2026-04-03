# 🎯 Pack 02: CRO & Optimización de Conversión

> Instalar cuando un agente necesite optimizar tasas de conversión, diseñar A/B tests, reducir fricción en formularios/signup/checkout, o prevenir churn.

---

## Qué capacidades da este pack

- Análisis CRO por página (friction audit, trust signals, CTA optimization)
- Optimización de flujos: signup, onboarding, forms, popups, paywalls
- Diseño estadístico de A/B tests (sample size, significance, duration)
- Prevención de churn (early warning signals, retention playbooks, win-back)
- Frameworks de priorización: ICE, PIE, RICE

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Marketing Strategy Agent | Global | Estrategia CRO cross-portfolio |
| Analytics Agent | OraAI, NewsletterAI, CoachingAI | Conversión free→pago |
| CMO Traffic Agent | TODOS | Optimizar landing pages |
| CEO Agent (negocio) | TODOS | KPIs de conversión |

## Instalación

```bash
npx skills add coreyhaines31/marketingskills/page-cro
npx skills add coreyhaines31/marketingskills/signup-flow-cro
npx skills add coreyhaines31/marketingskills/onboarding-cro
npx skills add coreyhaines31/marketingskills/form-cro
npx skills add coreyhaines31/marketingskills/popup-cro
npx skills add coreyhaines31/marketingskills/paywall-upgrade-cro
npx skills add coreyhaines31/marketingskills/ab-test-setup
npx skills add coreyhaines31/marketingskills/churn-prevention
```

**Total: 8 skills**

## Verificación

```
"Analiza la página de pricing de betvip.es y genera 5 hipótesis de test A/B priorizadas con ICE"
```

## Dependencias

- **Pack 03 (Marketing & Growth)** para `copywriting` y `marketing-psychology` — mejoran las hipótesis CRO con triggers psicológicos
- Sin dependencias técnicas externas

## Cuándo NO instalar

- Agentes que no tienen contacto con usuarios finales (Data Intelligence, Financial Control)
- Clinical Agent (MediAI) — CRO no aplica a flujos clínicos
