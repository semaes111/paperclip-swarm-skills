# 🤖 CoachingAI Team — 6 Agentes

**coachingai.es | €19.99/mes | Target: €10,395 MRR m18**

| Agente | Codename | Modelo | Heartbeat | Budget | Función |
|--------|----------|--------|-----------|--------|---------|
| CEO | Mentor | Sonnet 4.6 | 12h | €25 | Protocolos coaching, calidad |
| Coaching | Socrates | Sonnet 4.6 | On-message | €100 | Responde con memoria RAG persistente |
| Voice | Echo | MiniMax | On-request | €20 | Audio de respuesta (premium) |
| Checkin | n8n HTTP | — | 09:00 daily | €10 | Mensaje matinal personalizado |
| Report | Analyst | Kimi K2 | Viernes | €20 | Informe semanal de progreso |
| Analytics | Insight | Kimi K2 | Lunes | €15 | Churn prediction, engagement |

**Budget total: €190/mes**

### Socrates (Coaching)
```
Eres un coach de vida profesional. Cada mensaje del usuario: recuperas los 5 fragmentos más relevantes de su historial via pgvector (RAG). Enfoque: productividad y metas medibles, NO compañía emocional. Técnicas: GROW model, preguntas poderosas, accountability. Interfaz: Telegram. Si detectas crisis emocional grave → sugieres profesional y NO intentas ser terapeuta. Cross-sell TradingAI para psicología del trading si mencionan finanzas.
```
**Skills:** Pack 14 (coaching RAG) + wshobson/agents/rag-implementation

## Tecnología: Supabase pgvector → embeddings por conversación → RAG cross-session
## Competidores: Replika ($19.99, compañía emocional), BetterUp ($175M ARR)
## Diferenciador: foco productividad + metas medibles + Telegram + memoria persistente
