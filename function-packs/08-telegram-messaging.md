# 📱 Pack 08: Telegram & Mensajería

> Instalar cuando un agente necesite gestionar bots de Telegram, enviar mensajes a canales, verificar suscripciones, o implementar el gating Telegram↔Stripe.

---

## Qué capacidades da

- Desarrollo de bots Telegram (Telegraf/grammY)
- Envío de mensajes a canales/grupos
- Verificación de suscripción activa antes de acceso a canal VIP
- Monetización via Telegram Payments
- FSM (finite state machine) para conversaciones
- Bridge Claude↔Telegram con modo daemon

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Telegram Agent | TODOS (10 bots) | Envío diario + gating |
| Support Agent | MediAI | Recordatorios medicación |
| Alert Agent | MediAI, TradingAI | Alertas urgentes |
| Checkin Agent | CoachingAI | Mensaje matinal personalizado |

## Instalación

```bash
# Bot builder
npx skills add sickn33/antigravity-awesome-skills/telegram-bot-builder

# n8n para scheduling
npx skills add czlonkowski/n8n-skills

# CUSTOM: Subscription gating (copiar del repo)
cp -r custom-skills/telegram-subscription-gate/ ~/.claude/skills/user/
```

**Total: 2 npx + 1 custom skill**

## Verificación

```
"Diseña el bot de Telegram para OraAI: envía horóscopo gratuito a las 08:00 UTC al canal free, verifica suscripción Stripe antes de enviar lectura VIP personalizada al canal privado"
```

## Dependencias

- **Pack 06 (Payments)** para el flujo Stripe↔Telegram
- **Pack 07 (DevOps)** para n8n workflows
- Token de bot por negocio via @BotFather

## Cuándo NO instalar

- Agentes que no interactúan con Telegram
- Content Agents (generan contenido, no lo envían)
- Quant/Data Agents
