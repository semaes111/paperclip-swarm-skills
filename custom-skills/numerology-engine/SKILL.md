---
name: numerology-engine
description: "Motor de cálculos numerológicos Pitagórico y Caldeo. Usar cuando NumerologíaAI necesite: calcular número de vida, número de expresión, número de alma, año personal, compatibilidad numérica, o generar guía personalizada."
---
# Numerology Engine

## Sistemas Soportados
- **Pitagórico** (occidental, más común)
- **Caldeo** (más antiguo, basado en vibraciones)

## Tabla de Conversión Pitagórica
```
1: A, J, S     4: D, M, V     7: G, P, Y
2: B, K, T     5: E, N, W     8: H, Q, Z
3: C, L, U     6: F, O, X     9: I, R
```

## Cálculos Core

### Número de Vida (Life Path)
```python
def life_path(birth_date: str) -> int:
    """birth_date format: DD/MM/YYYY"""
    digits = [int(d) for d in birth_date if d.isdigit()]
    total = sum(digits)
    while total > 9 and total not in (11, 22, 33):  # Master numbers
        total = sum(int(d) for d in str(total))
    return total
```

### Número de Expresión (nombre completo)
```python
def expression_number(full_name: str) -> int:
    table = {'A':1,'B':2,'C':3,'D':4,'E':5,'F':6,'G':7,'H':8,'I':9,
             'J':1,'K':2,'L':3,'M':4,'N':5,'O':6,'P':7,'Q':8,'R':9,
             'S':1,'T':2,'U':3,'V':4,'W':5,'X':6,'Y':7,'Z':8}
    total = sum(table.get(c.upper(), 0) for c in full_name)
    while total > 9 and total not in (11, 22, 33):
        total = sum(int(d) for d in str(total))
    return total
```

### Año Personal
```python
def personal_year(birth_day: int, birth_month: int, current_year: int) -> int:
    total = birth_day + birth_month + sum(int(d) for d in str(current_year))
    while total > 9:
        total = sum(int(d) for d in str(total))
    return total
```

## Interpretaciones por Número
- **1:** Liderazgo, independencia, nuevos comienzos
- **2:** Cooperación, diplomacia, sensibilidad
- **3:** Creatividad, expresión, comunicación
- **4:** Estabilidad, estructura, trabajo duro
- **5:** Cambio, libertad, aventura
- **6:** Responsabilidad, hogar, armonía
- **7:** Espiritualidad, análisis, introspección
- **8:** Poder, abundancia, éxito material
- **9:** Humanitarismo, compasión, finalización
- **11:** Intuición, iluminación (Master Number)
- **22:** Maestro constructor (Master Number)
- **33:** Maestro sanador (Master Number)

## 2026 = Año Universal 1 (2+0+2+6=10→1)
Año de nuevos comienzos. El Content Agent de NumerologíaAI debe enfatizar este contexto en toda comunicación.
