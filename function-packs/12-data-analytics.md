# 📈 Pack 12: Data Analytics & Processing

> Instalar cuando un agente necesite procesar datasets (CSV/Excel/JSON), hacer EDA, detectar anomalías, generar visualizaciones, o aplicar modelos estadísticos.

---

## Qué capacidades da

- Data profiling: shape, dtypes, nulls, outliers, quality score
- Data cleaning: duplicates, nulls handling, type conversion
- Exploratory Data Analysis: distribuciones, correlaciones, trends
- Segment analysis: group by, aggregations, pivot tables
- Outlier detection (IQR, Z-score)
- Growth analysis (MoM, YoY)
- Visualización: matplotlib, seaborn
- Optimización Python para datasets grandes

## Agentes que lo usan

| Agente | Negocio | Para qué |
|--------|---------|----------|
| Data Intelligence Agent | Global | Métricas diarias cross-portfolio |
| Analytics Agent | OraAI, Newsletter, Coaching | Conversión, engagement |
| Quant Agent | BetVIP, TradingAI, Fantasy | Stats deportivas/financieras |
| Nutrition Agent | MediAI | Tracking macros |
| Financial Control Agent | Global | P&L data processing |

## Instalación

```bash
# Core data analysis
npx skills add supercent-io/skills-template/data-analysis

# Performance optimization
npx skills add wshobson/agents/python-performance-optimization

# Database
npx skills add supabase/agent-skills/supabase-postgres-best-practices

# Spreadsheets
npx skills add anthropics/skills/xlsx

# Python dependencies (ejecutar en el entorno)
pip install pandas numpy matplotlib seaborn openpyxl
```

**Total: 4 npx + pip dependencies**

## Verificación

```
"Carga el CSV de métricas del mes pasado, haz profiling, detecta anomalías en MRR y churn, genera un resumen con top 5 insights y gráficos de tendencia"
```

## Dependencias

- **Python 3.10+** con pandas, numpy, matplotlib, seaborn, openpyxl
- **Supabase** para queries a schemas de negocio

## Cuándo NO instalar

- Telegram Agents (solo envían, no analizan)
- Voice Agents (solo generan audio)
- Publisher Agents (solo despliegan)
