# 💳 Pack 06: Payments & Billing (Stripe)

> Instalar cuando un agente necesite gestionar suscripciones Stripe, webhooks de pago, dunning (recovery de pagos fallidos), o checkout flows.

---

## Qué capacidades da

- Arquitectura de Stripe: Billing, Checkout Sessions, Connect
- Gestión de suscripciones: crear, upgrade, downgrade, cancelar
- Webhook handling: payment_succeeded, subscription_deleted, invoice.payment_failed
- Dunning management: reintentos automáticos, emails de pago fallido
- PCI DSS compliance
- Invoice generation

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Financial Control Agent | Global | Monitoring revenue Stripe |
| Telegram Agent | TODOS | Verificar suscripción antes de acceso VIP |
| Publisher Agent | TODOS | Webhook handling en Edge Functions |

## Instalación

```bash
# Official Stripe
npx skills add stripe/ai/stripe-best-practices
npx skills add stripe/ai/upgrade-stripe

# Implementation
npx skills add wshobson/agents/stripe-integration
npx skills add wshobson/agents/billing-automation
npx skills add wshobson/agents/pci-compliance
```

**Total: 5 skills**

## Verificación

```
"Diseña el flujo de webhook Stripe para gestionar suscripciones de BetVIP: pago exitoso → acceso Telegram VIP, pago fallido → dunning 3 reintentos → expulsión canal"
```

## Dependencias

- **Pack 08 (Telegram)** para el gating Telegram↔Stripe
- **Stripe API keys** configuradas en Supabase Vault

## Cuándo NO instalar

- Agentes que no interactúan con pagos
- Content Agents, CMO Agents, Quant Agents
