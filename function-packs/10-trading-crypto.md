# 📊 Pack 10: Trading & Crypto Signals

> Instalar cuando un agente necesite análisis técnico, generación de señales de trading, sentiment analysis de mercados crypto, o gestión de riesgo de posiciones.

---

## Qué capacidades da

- Análisis técnico multi-timeframe (RSI, MACD, Bollinger Bands, patterns)
- Generación de señales: entrada exacta, stop-loss, take-profit
- Sentiment analysis crypto (Fear & Greed Index, social media)
- 62 skills DeFi/quant: birdeye, dexscreener, coingecko APIs
- Cross-verification de datos con tolerancia ±5%
- Portfolio tracking y risk management
- Backtesting con transaction costs

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Quant Agent | TradingAI | Análisis técnico cada 15 min |
| Signal Agent | TradingAI | Formato señal profesional |
| Marketing Agent | TradingAI | Publicar resultados (ganancias Y pérdidas) |

## Instalación

```bash
# Crypto & DeFi (62 skills)
npx skills add agiprolabs/claude-trading-skills

# Trading signals con 3 AI analysts
git clone https://github.com/roman-rr/trading-skills
cp -r trading-skills/.claude/skills/* ~/.claude/skills/user/

# Risk & backtesting
npx skills add wshobson/agents/risk-metrics-calculation
npx skills add wshobson/agents/backtesting-frameworks

# Data processing
npx skills add wshobson/agents/python-performance-optimization
```

**Total: 3 npx + 1 clone**

## ⚠️ DISCLAIMER OBLIGATORIO

Todo contenido público DEBE incluir:
```
"Esto NO es consejo financiero. Trading conlleva riesgo de pérdida total. Rentabilidades pasadas no garantizan futuras."
```

## Verificación

```
"Analiza BTC/USDT en timeframes 1H/4H/1D: identifica si hay patrón técnico con R/R >2:1, genera señal con entry, SL, TP, y contexto de mercado"
```

## Dependencias

- **CoinGecko API** (free tier) para precios
- **Pack 12 (Data Analytics)** para procesamiento estadístico
- Historial en `tradingai.signals` INMUTABLE

## Cuándo NO instalar

- Cualquier negocio que NO sea TradingAI
