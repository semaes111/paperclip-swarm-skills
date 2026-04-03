---
name: telegram-subscription-gate
description: "Gating de acceso a canales Telegram VIP basado en suscripción Stripe. Usar cuando cualquier Telegram Agent necesite verificar que un usuario tiene suscripción activa antes de enviar contenido premium."
---
# Telegram Subscription Gate

## Flujo de Verificación
```
Usuario intenta acceder a canal VIP
         │
    ¿Tiene user_id en mapping Telegram↔Stripe?
    ┌────┴────┐
   NO         SÍ
    │          │
  Enviar   ¿Suscripción activa en Supabase?
  link de  ┌────┴────┐
  pago     NO         SÍ
    │       │          │
         Enviar      PERMITIR ACCESO
         link de     al canal VIP
         reactivación

```

## Implementación n8n
### Webhook: Stripe → Supabase → Telegram
```
1. Stripe webhook: customer.subscription.created
2. Edge Function: extraer customer_id, buscar telegram_user_id en mapping
3. Supabase: INSERT INTO [negocio].subscriptions (status: 'active')
4. n8n: Telegram Bot API → inviteUser al canal privado
5. Resend: email de bienvenida con link al canal
```

### Webhook: Cancelación
```
1. Stripe webhook: customer.subscription.deleted / invoice.payment_failed
2. Supabase: UPDATE subscriptions SET status = 'cancelled'
3. n8n (delay 30 min): Telegram Bot API → banChatMember del canal
4. Resend: email "te echamos de menos" + oferta reactivación
```

## Tablas Supabase (por negocio)
```sql
CREATE TABLE [schema].telegram_mapping (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  stripe_customer_id TEXT NOT NULL,
  telegram_user_id BIGINT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(stripe_customer_id),
  UNIQUE(telegram_user_id)
);

CREATE TABLE [schema].subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  stripe_customer_id TEXT NOT NULL REFERENCES telegram_mapping(stripe_customer_id),
  stripe_subscription_id TEXT NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('active','cancelled','past_due')),
  current_period_end TIMESTAMPTZ,
  updated_at TIMESTAMPTZ DEFAULT now()
);
```

## Verificación en Tiempo Real
```python
async def is_subscriber(telegram_user_id: int, schema: str) -> bool:
    result = await supabase.from_(f"{schema}.telegram_mapping") \
        .select("stripe_customer_id") \
        .eq("telegram_user_id", telegram_user_id) \
        .single()
    
    if not result: return False
    
    sub = await supabase.from_(f"{schema}.subscriptions") \
        .select("status") \
        .eq("stripe_customer_id", result["stripe_customer_id"]) \
        .eq("status", "active") \
        .single()
    
    return sub is not None
```
