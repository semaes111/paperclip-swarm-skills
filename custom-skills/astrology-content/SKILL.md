---
name: astrology-content
description: "Generación de contenido astrológico para OraAI. Usar cuando el Content Agent de OraAI necesite: horóscopo diario, lectura semanal, compatibilidad de signos, tránsitos planetarios, o interpretación de carta natal."
---
# Astrology Content Generator

## Estructura de Horóscopo Diario (por signo)
```
1. Energía general del día (1-2 frases)
2. Área de vida destacada (amor, trabajo, salud, dinero)
3. Consejo específico (acción concreta)
4. Número de la suerte + color del día
5. Compatibilidad del día (signo más afín)
```

## Tránsitos a Monitorear
Fuentes: astrology-api.io MCP (16 herramientas)
- Luna: cambio diario → tono emocional del horóscopo
- Mercurio retrógrado: comunicación, tecnología (3-4 veces/año)
- Venus: amor, dinero (tránsito ~25 días por signo)
- Marte: energía, conflicto, acción
- Eclipses: eventos transformadores (4-6/año)

## Elementos por Signo
- **Fuego** (Aries, Leo, Sagitario): Acción, pasión, liderazgo
- **Tierra** (Tauro, Virgo, Capricornio): Estabilidad, pragmatismo
- **Aire** (Géminis, Libra, Acuario): Comunicación, ideas
- **Agua** (Cáncer, Escorpio, Piscis): Emociones, intuición

## Reglas de Contenido
1. NUNCA predecir eventos negativos concretos (muerte, enfermedad, accidente)
2. Siempre enmarcar como "energías" y "tendencias", no como certezas
3. Incluir disclaimer: "Entretenimiento. No sustituye consejo profesional."
4. Personalizar por carta natal completa (VIP) vs signo solar (free)
5. Cross-sell NumerologíaAI cuando el contenido mencione números significativos

## MCP: astrology-api.io
```
Herramientas disponibles: natal_chart, transits, synastry,
composite, solar_return, lunar_return, progressions,
horoscope_daily, horoscope_weekly, horoscope_monthly,
planetary_hours, void_of_course_moon, retrograde_planets,
eclipse_data, aspect_patterns, astrocartography
```
