# ⚽ Pack 09: Sports & Betting Analytics

> Instalar cuando un agente necesite analizar estadísticas deportivas, calcular value bets, generar picks, optimizar alineaciones fantasy, o gestionar historial de apuestas.

---

## Qué capacidades da

- Análisis estadístico de partidos (spreads, O/U, props)
- Conversión odds americanas/decimales/fraccionarias → probabilidad implícita
- Kelly Criterion para staking óptimo
- Identificación de value bets
- Fantasy lineup optimization con confidence levels
- Backtesting de estrategias con prevención de look-ahead bias
- Risk metrics: VaR, Sharpe, Sortino, drawdown

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Quant/Data Agent | BetVIP | Análisis estadístico de partidos |
| Pick Agent | BetVIP | Redacción de picks con justificación |
| Data Agent | FantasySports | Stats jugadores, lesiones |
| Pick Agent | FantasySports | Alineación óptima |

## Instalación

```bash
# Sports analysis
npx skills add OneWave-AI/claude-skills    # sports-betting-analyzer + fantasy-lineup-optimizer

# Backtesting & risk
npx skills add wshobson/agents/backtesting-frameworks
npx skills add wshobson/agents/risk-metrics-calculation

# CUSTOM: DGOJ compliance (obligatorio para España)
cp -r custom-skills/dgoj-compliance/ ~/.claude/skills/user/
```

**Total: 3 npx + 1 custom skill**

## ⚠️ COMPLIANCE OBLIGATORIO

Todo contenido publicado DEBE incluir:
```
"Juega con responsabilidad. Solo +18. Línea de ayuda: 900 200 225 (DGOJ)."
```
Horario publicidad: SOLO 20:00-01:00 hora España.

## Verificación

```
"Analiza Real Madrid vs Barcelona de mañana: odds, stats históricas, value bet si existe, y genera pick con stake recomendado (Kelly) incluyendo disclaimer DGOJ"
```

## Dependencias

- **football-data.org API** (€25/mes) para datos de partidos
- **Pack 12 (Data Analytics)** para procesamiento estadístico pesado
- **Custom skill dgoj-compliance** OBLIGATORIA

## Cuándo NO instalar

- Cualquier negocio que NO sea BetVIP o FantasySports
