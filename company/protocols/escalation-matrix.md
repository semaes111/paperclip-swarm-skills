# 🚨 Escalation Matrix

## Niveles de prioridad

| Nivel | Tiempo respuesta | Quién resuelve | Ejemplos |
|-------|-----------------|----------------|----------|
| **P0** | <15 minutos | Atlas + Hephaestus + Board si >1h | Alerta clínica MediAI, sitio caído, fraude, breach |
| **P1** | <1 hora | Atlas decide | MRR caída >20%, error pago suscriptor, churn spike |
| **P2** | <24 horas | Agente responsable | Contenido diario, reporte semanal, optimización |
| **P3** | <72 horas | Agente responsable | Research competidor, backlinks, optimización copy |

## Matriz de decisión por coste

```
                    ┌─────────────────┐
                    │  ¿Cuánto cuesta? │
                    └────────┬────────┘
                             │
              ┌──────────────┼──────────────┐
              │              │              │
         < €50          €50-€200        > €200
              │              │              │
         Ejecutar       Atlas          Board Member
         directo        aprueba        aprueba
              │              │              │
         Log en         Ticket con     Telegram +
         Paperclip      justificación  esperar OK
```

## Escalación por tipo de incidente

### Técnico
```
Error de build Vercel → Hephaestus intenta fix → si no puede: P1 a Atlas
Container Docker crash → Hephaestus restart → si loop: escalar VPS → si persiste: P0
API externa caída → Hephaestus detecta → fallback o degradación graceful → P2 a Atlas
```

### Financiero
```
Token budget 95% → Minerva pausa agente automáticamente (excepto MediAI Clinical)
Cash flow negativo en negocio → Minerva P1 a Atlas → evaluar: pausar/optimizar/cerrar
Revenue anomalía →  Hermes detecta → P1 a Atlas si negativa, P2 si positiva
```

### Legal
```
Contenido sin disclaimer DGOJ publicado → Themis P0 → retirar inmediato + fix
Breach de datos detectado → P0 → Board Member + AEPD en 72h
Cambio regulatorio → Themis P2 → brief a Atlas → si impacto alto: Board
```

### Clínico (MediAI ONLY)
```
Síntoma crítico reportado → P0 ABSOLUTO → Dr. Sergio via Telegram INMEDIATO
Paciente solicita acceso a datos → Themis verifica ARCO → responder en <30 días
Queja de paciente → Hippocrates (CEO MediAI) → si grave: Board Member
```

## Protocolo de comunicación

### Entre agentes
- SIEMPRE via ticket system de Paperclip
- NUNCA mensajes directos sin ticket
- Incluir: from, to, priority, subject, data, recommended_action, requires_approval

### Agente → Board Member
- Telegram para urgencias (P0, P1 no resueltos en 1h)
- Email para reportes programados (semanal)
- NUNCA interrumpir para P2/P3 — acumular en reporte semanal

### Board Member → Agentes
- Respuesta via Telegram reply → Atlas distribuye a agente correspondiente
- Aprobaciones: "OK", "No", "Más info" son válidas
- Si no responde en 24h a P1 → Atlas toma decisión autónoma documentando razón
