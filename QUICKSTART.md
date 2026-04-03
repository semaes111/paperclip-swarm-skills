# 🚀 QUICKSTART — De repo a empresa autónoma operativa

> Guía paso a paso para desplegar el swarm completo de NextHorizont AI.
> Dos rutas: **Docker Compose** (CLI puro) o **Dokploy** (panel web).
> Tiempo estimado: 2-3 horas la primera vez.

---

## Requisitos previos

| Requisito | Detalle |
|-----------|---------|
| VPS | Hostinger KVM2 (2 vCPU, 8GB RAM, 100GB SSD) o superior |
| OS | Ubuntu 22.04+ o Debian 12+ |
| Docker | Docker Engine 24+ con Docker Compose v2 |
| Dokploy | (solo ruta B) Instalado en el VPS |
| Dominios | 10 dominios configurados en Cloudflare apuntando al VPS |
| Supabase | Proyecto Pro con 10 schemas creados |
| Stripe | 10 productos con precios configurados |
| Telegram | 10 bot tokens via @BotFather |
| GitHub | Acceso al repo `semaes111/paperclip-swarm-skills` |
| APIs | Anthropic, Moonshot (Kimi K2), MiniMax, DataForSEO, football-data.org, CoinGecko |

---

## PASO 1: Clonar el repo (ambas rutas)

```bash
ssh root@TU_IP_VPS

git clone https://github.com/semaes111/paperclip-swarm-skills.git
cd paperclip-swarm-skills
```

---

## PASO 2: Crear archivo de variables de entorno

```bash
cat > .env << 'EOF'
# ═══ DATABASE ═══
POSTGRES_PASSWORD=CAMBIA_ESTO_generarconpasswd
DB_PASSWORD=${POSTGRES_PASSWORD}

# ═══ N8N ═══
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=CAMBIA_ESTO_n8npass
N8N_HOST=n8n.nexthorizont.ai
N8N_ENCRYPTION_KEY=GENERA_CON_openssl_rand_hex_32

# ═══ PAPERCLIP ═══
PAPERCLIP_DATABASE_URL=postgresql://postgres:${POSTGRES_PASSWORD}@postgres:5432/paperclip

# ═══ AI MODELS ═══
ANTHROPIC_API_KEY=sk-ant-xxx
MOONSHOT_API_KEY=xxx
MINIMAX_API_KEY=xxx

# ═══ SERVICES ═══
STRIPE_SECRET_KEY=sk_live_xxx
STRIPE_WEBHOOK_SECRET=whsec_xxx
RESEND_API_KEY=re_xxx
DATAFORSEO_LOGIN=xxx
DATAFORSEO_PASSWORD=xxx
FOOTBALL_DATA_API_KEY=xxx
COINGECKO_API_KEY=xxx

# ═══ SUPABASE ═══
SUPABASE_URL=https://bpazmmbjjducdmxgfoum.supabase.co
SUPABASE_SERVICE_ROLE_KEY=xxx

# ═══ TELEGRAM BOTS (1 por negocio) ═══
TELEGRAM_BOT_TOKEN_ORAAI=xxx
TELEGRAM_BOT_TOKEN_BETVIP=xxx
TELEGRAM_BOT_TOKEN_HECHIZOSAI=xxx
TELEGRAM_BOT_TOKEN_TRADINGAI=xxx
TELEGRAM_BOT_TOKEN_NEWSLETTERAI=xxx
TELEGRAM_BOT_TOKEN_NUMEROLOGIAAI=xxx
TELEGRAM_BOT_TOKEN_COACHINGAI=xxx
TELEGRAM_BOT_TOKEN_CURSOSAI=xxx
TELEGRAM_BOT_TOKEN_FANTASYSPORTS=xxx
TELEGRAM_BOT_TOKEN_MEDIAI=xxx

# ═══ DOMAINS ═══
DOMAIN_MAIN=nexthorizont.ai
EOF

# Generar keys seguras
sed -i "s/CAMBIA_ESTO_generarconpasswd/$(openssl rand -hex 16)/" .env
sed -i "s/CAMBIA_ESTO_n8npass/$(openssl rand -hex 12)/" .env
sed -i "s/GENERA_CON_openssl_rand_hex_32/$(openssl rand -hex 32)/" .env

echo "⚠️  EDITA .env con tus API keys reales antes de continuar"
```

---

# ═══════════════════════════════════════════════════════
# RUTA A: Docker Compose (CLI puro)
# ═══════════════════════════════════════════════════════

## A3: Docker Compose file

```bash
cat > docker-compose.yml << 'COMPOSE'
version: '3.8'

services:
  # ─── PostgreSQL (base de datos de Paperclip) ───
  postgres:
    image: postgres:17-alpine
    container_name: paperclip-db
    restart: unless-stopped
    environment:
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: paperclip
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5
    networks:
      - internal

  # ─── Paperclip (CEO de agentes) ───
  paperclip:
    image: paperclipai/paperclip:latest
    container_name: paperclip
    restart: unless-stopped
    ports:
      - "3100:3100"
      - "3101:3101"
    environment:
      DATABASE_URL: postgresql://postgres:${POSTGRES_PASSWORD}@postgres:5432/paperclip
      ANTHROPIC_API_KEY: ${ANTHROPIC_API_KEY}
      MOONSHOT_API_KEY: ${MOONSHOT_API_KEY}
    depends_on:
      postgres:
        condition: service_healthy
    networks:
      - internal
      - web
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.paperclip.rule=Host(`paperclip.${DOMAIN_MAIN}`)"
      - "traefik.http.routers.paperclip.tls.certresolver=le"
      - "traefik.http.services.paperclip.loadbalancer.server.port=3101"

  # ─── n8n (automatización de workflows) ───
  n8n:
    image: docker.n8n.io/n8nio/n8n:latest
    container_name: n8n
    restart: unless-stopped
    environment:
      - N8N_HOST=${N8N_HOST}
      - N8N_PORT=5678
      - N8N_PROTOCOL=https
      - NODE_ENV=production
      - WEBHOOK_URL=https://${N8N_HOST}/
      - N8N_SECURE_COOKIE=false
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=${N8N_BASIC_AUTH_USER}
      - N8N_BASIC_AUTH_PASSWORD=${N8N_BASIC_AUTH_PASSWORD}
      - N8N_ENCRYPTION_KEY=${N8N_ENCRYPTION_KEY}
      - GENERIC_TIMEZONE=Europe/Madrid
      # Pasar todas las API keys para que n8n pueda usarlas
      - ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
      - STRIPE_SECRET_KEY=${STRIPE_SECRET_KEY}
      - SUPABASE_URL=${SUPABASE_URL}
      - SUPABASE_SERVICE_ROLE_KEY=${SUPABASE_SERVICE_ROLE_KEY}
      - RESEND_API_KEY=${RESEND_API_KEY}
    volumes:
      - n8n_data:/home/node/.n8n
    networks:
      - internal
      - web
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.n8n.rule=Host(`${N8N_HOST}`)"
      - "traefik.http.routers.n8n.tls.certresolver=le"
      - "traefik.http.services.n8n.loadbalancer.server.port=5678"

  # ─── Traefik (reverse proxy + SSL) ───
  traefik:
    image: traefik:v3
    container_name: traefik
    restart: unless-stopped
    command:
      - "--api.dashboard=false"
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.web.address=:80"
      - "--entrypoints.websecure.address=:443"
      - "--entrypoints.web.http.redirections.entrypoint.to=websecure"
      - "--certificatesresolvers.le.acme.email=sergio@nexthorizont.ai"
      - "--certificatesresolvers.le.acme.storage=/letsencrypt/acme.json"
      - "--certificatesresolvers.le.acme.httpchallenge.entrypoint=web"
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - letsencrypt:/letsencrypt
    networks:
      - web

volumes:
  postgres_data:
  n8n_data:
  letsencrypt:

networks:
  internal:
    driver: bridge
  web:
    driver: bridge
COMPOSE
```

## A4: Levantar los servicios

```bash
docker compose up -d

# Verificar
docker compose ps
# Deberías ver: postgres (healthy), paperclip (running), n8n (running), traefik (running)

# Verificar Paperclip
curl -s http://localhost:3100/health
# Esperado: {"status":"ok"}

# Verificar n8n
curl -s http://localhost:5678/healthz
# Esperado: {"status":"ok"}
```

---

# ═══════════════════════════════════════════════════════
# RUTA B: Dokploy (panel web)
# ═══════════════════════════════════════════════════════

## B1: Instalar Dokploy (si no está instalado)

```bash
curl -sSL https://dokploy.com/install.sh | sh
# → Acceder en http://TU_IP:3000
# → Crear cuenta admin
# → Configurar dominio: dokploy.nexthorizont.ai con HTTPS Let's Encrypt
```

## B2: Crear proyecto en Dokploy

1. Panel Dokploy → **Projects** → **New Project** → nombre: `nexthorizont-swarm`

## B3: Desplegar PostgreSQL

1. Dentro del proyecto → **+ Create Service** → **Database** → **PostgreSQL**
2. Configurar:
   - Name: `paperclip-db`
   - Version: `17`
   - Password: (generar automático — copiar para luego)
   - Database Name: `paperclip`
3. Click **Deploy**
4. Anotar el **Internal Host**: algo como `paperclip-db-xxxxx:5432`

## B4: Desplegar Paperclip como Docker Compose

1. Dentro del proyecto → **+ Create Service** → **Compose**
2. Name: `paperclip`
3. En el editor de Compose, pegar:

```yaml
version: '3.8'
services:
  paperclip:
    image: paperclipai/paperclip:latest
    restart: unless-stopped
    environment:
      - DATABASE_URL=postgresql://postgres:${DB_PASSWORD}@${DB_HOST}:5432/paperclip
      - ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
      - MOONSHOT_API_KEY=${MOONSHOT_API_KEY}
    networks:
      - dokploy-network

networks:
  dokploy-network:
    external: true
```

4. Pestaña **Environment** → añadir:
   - `DB_PASSWORD` = la contraseña del PostgreSQL de B3
   - `DB_HOST` = el Internal Host del PostgreSQL de B3
   - `ANTHROPIC_API_KEY` = tu clave de Anthropic
   - `MOONSHOT_API_KEY` = tu clave de Moonshot

5. Pestaña **Domains** → añadir:
   - Host: `paperclip.nexthorizont.ai`
   - Port: `3100`
   - HTTPS: ✅
   - **Añadir segundo dominio** para el dashboard:
   - Host: `paperclip-dash.nexthorizont.ai`
   - Port: `3101`
   - HTTPS: ✅

6. Click **Deploy**

> ⚠️ **Importante Dokploy:** Usar `dokploy-network` con `external: true` para que los servicios dentro del mismo proyecto puedan comunicarse entre sí y con el Traefik de Dokploy.

## B5: Desplegar n8n como Docker Compose

1. Dentro del proyecto → **+ Create Service** → **Compose**
2. Name: `n8n`
3. Pegar:

```yaml
version: '3.8'
services:
  n8n:
    image: docker.n8n.io/n8nio/n8n:latest
    restart: unless-stopped
    environment:
      - N8N_HOST=${N8N_DOMAIN}
      - N8N_PORT=5678
      - N8N_PROTOCOL=https
      - NODE_ENV=production
      - WEBHOOK_URL=https://${N8N_DOMAIN}/
      - N8N_SECURE_COOKIE=false
      - N8N_ENCRYPTION_KEY=${N8N_ENCRYPTION_KEY}
      - GENERIC_TIMEZONE=Europe/Madrid
      - ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
      - STRIPE_SECRET_KEY=${STRIPE_SECRET_KEY}
      - SUPABASE_URL=${SUPABASE_URL}
      - SUPABASE_SERVICE_ROLE_KEY=${SUPABASE_SERVICE_ROLE_KEY}
      - RESEND_API_KEY=${RESEND_API_KEY}
    volumes:
      - n8n_data:/home/node/.n8n
    networks:
      - dokploy-network

volumes:
  n8n_data:

networks:
  dokploy-network:
    external: true
```

4. Pestaña **Environment** → añadir todas las variables
5. Pestaña **Domains**:
   - Host: `n8n.nexthorizont.ai`
   - Port: `5678`
   - HTTPS: ✅
6. Click **Deploy**

## B6: Verificar en Dokploy

- Panel → proyecto `nexthorizont-swarm` → deberías ver 3 servicios: PostgreSQL, Paperclip, n8n todos en **Running**
- Abrir `https://paperclip.nexthorizont.ai` → API de Paperclip
- Abrir `https://paperclip-dash.nexthorizont.ai` → Dashboard Paperclip
- Abrir `https://n8n.nexthorizont.ai` → UI de n8n

---

# ═══════════════════════════════════════════════════════
# PASO 3: Instalar Skills (ambas rutas)
# ═══════════════════════════════════════════════════════

```bash
cd /root/paperclip-swarm-skills
bash scripts/install-all.sh
```

O instalar por paquetes funcionales según se necesite:
```bash
# Solo lo que necesites (ver function-packs/00-INDEX.md)
# Ejemplo: preparar BetVIP
# → Pack 09 (Sports) + Pack 06 (Payments) + Pack 08 (Telegram) + Pack 03 (Marketing)
```

---

# ═══════════════════════════════════════════════════════
# PASO 4: Crear empresa global en Paperclip
# ═══════════════════════════════════════════════════════

```bash
PAPERCLIP_URL="http://localhost:3100"  # Docker Compose
# o
PAPERCLIP_URL="https://paperclip.nexthorizont.ai"  # Dokploy

# 4.1 Onboarding
npx paperclipai onboard --yes

# 4.2 Crear empresa global
curl -X POST ${PAPERCLIP_URL}/api/companies \
  -H "Content-Type: application/json" \
  -d '{
    "name": "NextHorizont AI",
    "mission": "Portfolio de 10 negocios digitales 100% autónomos. Target: €200K MRR en 18 meses con <€10K/mes de costes.",
    "board_member": "Dr. Sergio",
    "contact_channel": "telegram"
  }'
# → Guardar el company_id devuelto
```

---

# ═══════════════════════════════════════════════════════
# PASO 5: Registrar agentes globales (C-Suite)
# ═══════════════════════════════════════════════════════

Cargar cada agente global con su system prompt del archivo correspondiente.

```bash
COMPANY_ID="xxx"  # El ID de NextHorizont AI del paso anterior

# Ejemplo: CEO Atlas
curl -X POST ${PAPERCLIP_URL}/api/companies/${COMPANY_ID}/agents \
  -H "Content-Type: application/json" \
  -d '{
    "role": "CEO",
    "codename": "atlas",
    "model": "claude-sonnet-4-6",
    "heartbeat_minutes": 240,
    "budget_monthly_eur": 100,
    "system_prompt": "Eres Atlas, el CEO Agent de NextHorizont AI SL...",
    "tools": ["supabase:shared", "telegram:board", "paperclip:tickets", "n8n:api"],
    "skills": ["pack-05-financial", "pack-15-orchestration"]
  }'

# Repetir para los 8 agentes globales:
# Cargar system prompt de cada archivo en company/agents/global/
# 01-ceo-atlas.md → atlas
# 02-cfo-minerva.md → minerva
# 03-cmo-apollo.md → apollo
# 04-cdo-hermes.md → hermes
# 05-cio-vulcan.md → vulcan
# 06-clo-themis.md → themis
# 07-growth-mercury.md → mercury
# 08-devops-hephaestus.md → hephaestus
```

---

# ═══════════════════════════════════════════════════════
# PASO 6: Crear sub-empresas (1 por negocio)
# ═══════════════════════════════════════════════════════

```bash
# Crear cada sub-empresa
for biz in OraAI BetVIP HechizosAI TradingAI NewsletterAI NumerologiaAI CoachingAI CursosAI FantasySports MediAI; do
  curl -X POST ${PAPERCLIP_URL}/api/companies \
    -H "Content-Type: application/json" \
    -d "{
      \"name\": \"${biz}\",
      \"parent_company_id\": \"${COMPANY_ID}\",
      \"mission\": \"Ver config/${biz,,}/manifest.json para detalle\"
    }"
  echo " → ${biz} creada"
done
```

Luego para cada negocio, cargar los agentes de su equipo:
- `company/agents/per-business/oraai-team.md` → 6 agentes de OraAI
- `company/agents/per-business/betvip-team.md` → 6 agentes de BetVIP
- ... (10 equipos)

---

# ═══════════════════════════════════════════════════════
# PASO 7: Configurar n8n workflows
# ═══════════════════════════════════════════════════════

Accede a `https://n8n.nexthorizont.ai` y crea estos workflows:

### 7.1 Workflow: Stripe → Supabase → Telegram (por negocio)
```
Trigger: Webhook (Stripe payment_intent.succeeded)
  → Code Node: extraer customer_id, subscription_id
  → Supabase Node: INSERT INTO [schema].subscriptions (status: active)
  → Supabase Node: SELECT telegram_user_id FROM [schema].telegram_mapping
  → IF: telegram_user_id exists
    → Telegram Node: inviteChatMember al canal VIP
  → Email Node (Resend): enviar welcome email
```

### 7.2 Workflow: Cancelación Stripe → Expulsar de Telegram
```
Trigger: Webhook (Stripe customer.subscription.deleted)
  → Supabase: UPDATE subscriptions SET status = 'cancelled'
  → Wait: 30 minutos (gracia)
  → Telegram: banChatMember del canal VIP
  → Email (Resend): "Te echamos de menos" + oferta reactivación
```

### 7.3 Workflow: Horóscopo diario OraAI
```
Trigger: Schedule (06:00 UTC daily)
  → Supabase: SELECT * FROM oraai.daily_readings WHERE date = TODAY
  → Telegram: enviar a canal free de OraAI con CTA
```

### 7.4 Workflow: Alerta clínica MediAI
```
Trigger: Supabase Realtime (INSERT en mediai.critical_alerts)
  → Telegram: enviar INMEDIATAMENTE al Dr. Sergio
  → Supabase: INSERT INTO shared.audit_log (tipo: P0_clinical)
```

Replicar el patrón Stripe→Telegram para los 10 negocios.

---

# ═══════════════════════════════════════════════════════
# PASO 8: Registrar n8n como HTTP Agent en Paperclip
# ═══════════════════════════════════════════════════════

```bash
# n8n actúa como "motor de ejecución" para Telegram Agents y Publisher Agents
curl -X POST ${PAPERCLIP_URL}/api/companies/${COMPANY_ID}/agents \
  -d '{
    "role": "AutomationEngine",
    "type": "http",
    "endpoint": "https://n8n.nexthorizont.ai/webhook",
    "heartbeat_minutes": 5,
    "codename": "n8n-engine"
  }'
```

---

# ═══════════════════════════════════════════════════════
# PASO 9: Verificar ciclo de heartbeats
# ═══════════════════════════════════════════════════════

```bash
# Esperar 4 horas para que Atlas complete su primer ciclo completo
# Verificar en Paperclip dashboard:
# → https://paperclip-dash.nexthorizont.ai

# Checklist de verificación:
echo "
□ Paperclip dashboard accesible
□ Atlas (CEO) completó primer heartbeat
□ Hephaestus (DevOps) reporta 10 sitios UP
□ Hermes (CDO) insertó primera fila en shared.daily_metrics
□ n8n workflows activos (ver https://n8n.nexthorizont.ai)
□ Telegram bots respondiendo (enviar /start a cada bot)
□ Stripe webhooks configurados y verificados
□ Supabase schemas accesibles desde Paperclip
"
```

---

# ═══════════════════════════════════════════════════════
# PASO 10: Primer reporte → Empresa operativa ✅
# ═══════════════════════════════════════════════════════

Si todo funciona, Atlas generará el primer reporte semanal el viernes 16:00 UTC y lo enviará a Dr. Sergio via Telegram:

```
📊 REPORTE SEMANAL — NextHorizont AI
Semana: [primera semana]

💰 MRR total: €0 (sin suscriptores aún)
🤖 Agentes activos: 58/58
⚡ Uptime: 100%
💸 Gasto tokens: €X.XX

✅ EMPRESA OPERATIVA — Todos los agentes en funcionamiento
📋 Siguiente: lanzar OraAI y BetVIP como primeros negocios activos
```

**🎉 En este momento, la empresa autónoma está operativa.**

Dr. Sergio supervisa revisando Telegram lunes y viernes.
Los agentes operan 24/7 sin intervención humana.

---

## Troubleshooting

| Problema | Solución |
|----------|----------|
| Paperclip no arranca | Verificar `DATABASE_URL` en .env. PostgreSQL debe estar healthy primero |
| n8n error "502 Bad Gateway" | En Dokploy: verificar que el servicio está en `dokploy-network` |
| Telegram bot no envía | Verificar token con `curl https://api.telegram.org/bot{TOKEN}/getMe` |
| Stripe webhook 404 | En Stripe Dashboard → Webhooks → verificar URL del endpoint n8n |
| Dokploy: servicio no accesible | Conectar container a `dokploy-network`: `docker network connect dokploy-network CONTAINER` |
| n8n no conecta a Supabase | Verificar `SUPABASE_URL` y `SUPABASE_SERVICE_ROLE_KEY` en env |
| Agente excede budget | Minerva (CFO) lo pausa automáticamente. Verificar en Paperclip dashboard |
| Sitio web caído | Hephaestus (DevOps) detecta en <1h y intenta restart. Si persiste: P0 a Atlas |

---

## Orden de lanzamiento de negocios (según roadmap)

| Mes | Negocio | Primera acción |
|-----|---------|---------------|
| 1 | **OraAI** | Primer horóscopo publicado + canal Telegram activo |
| 1 | **BetVIP** | Primer pick publicado en canal VIP |
| 2 | **MediAI** | Onboarding 30 pacientes de Centro NICA |
| 3 | HechizosAI | Primera biblioteca de rituales online |
| 3 | TradingAI | Primera señal crypto enviada |
| 5 | NewsletterAI | Primer número enviado via Beehiiv |
| 5 | NumerologíaAI | Campaña Año Universal 1 (2026) |
| 7 | CoachingAI | Primer usuario de coaching AI |
| 7 | CursosAI | Curso GLP-1 del Dr. Sergio publicado |
| 9 | FantasySports | Temporada fútbol 2026-27 |
