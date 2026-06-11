# Encaminamiento en Internet

> Asignatura: Infraestructura Informática para Centros de Datos (ICD) — Código 14534
> Basado en: Ampliación de Sistemas Operativos y Redes — UCM

---

## 1. Tablas de Encaminamiento

### Encaminamiento "Next-Hop"
- Principio de optimización: si el camino más corto entre A y D pasa por B, entonces el camino más corto de B a D es la misma ruta.
- Solo se necesita conocer el **siguiente encaminador inmediato** (_next hop_).

[Insertar imagen sobre: principio de encaminamiento next-hop]

### Estructura de una tabla de encaminamiento
- **Destino**
- **Máscara o prefijo de red (CIDR)**
- **Siguiente salto**
- **Coste** asociado al camino

Tipos de entrada destino:
- **Host específico** → no viable en Internet
- **Red** → con prefijo CIDR
- **Default** → para paquetes sin coincidencia

[Insertar imagen sobre: ejemplo de tabla de encaminamiento]

### Ejemplo práctico
Dada una topología de red:
1. Determinar la tabla de encaminamiento del router R1.
2. Procesar paquetes con destino `201.4.22.35` y `18.24.32.78`.

[Insertar imagen sobre: topología de red del ejemplo con routers R1, R2, etc.]

### Escalabilidad
- El encaminamiento con clase no es viable por el gran número de redes.
- Soluciones:
  - **CIDR** → agregación de direcciones y resumen de rutas.
  - **Encaminamiento jerárquico** → limita la información intercambiada.

[Insertar imagen sobre: agregación CIDR y jerarquía de encaminamiento]

---

## 2. Técnicas de Encaminamiento

### 2.1 Encaminamiento local
No usa topología global, solo información local.

- **Aleatorio**: elige una salida al azar. Simple pero no óptimo.
- **Aislado**: usa info local (mayor ancho de banda, menos congestión, round-robin).
- **Por inundación** (_flooding_): envía el paquete a todos los vecinos menos al origen.

[Insertar imagen sobre: encaminamiento por inundación - paquete propagándose a todos los vecinos]

#### Inundación — Detalles
- El destinatario recibe copias duplicadas → se usa un identificador para descartarlas.
- **Optimizaciones**: almacenar ID de paquetes retransmitidos; usar campo TTL.
- **Ventajas**: robusto, garantiza el camino más corto, visita todos los nodos.
- **Desventajas**: saturación por duplicados.

[Insertar imagen sobre: ejemplo de inundación en una red con múltiples routers]

### 2.2 Encaminamiento estático
- Considera la topología de la red.
- Las tablas se construyen **manualmente** y no se adaptan a cambios.

### 2.3 Encaminamiento dinámico
- Tablas construidas automáticamente mediante intercambio periódico de información.
- Se adaptan a cambios en la topología.
- Protocolos principales:
  - **Vectores de distancia** (ej. RIP)
  - **Estado de los enlaces** (ej. OSPF)

[Insertar imagen sobre: comparativa encaminamiento estático vs. dinámico]

---

## 3. Vectores de Distancia

### Fundamentos
- Cada encaminador mantiene una entrada por cada destino posible con: **destino**, **siguiente nodo**, **distancia/métrica**.
- Intercambio periódico de vectores de distancia con vecinos.
- Algoritmo de **Bellman-Ford**: converge iterativamente a caminos óptimos.
- Métrica típica: **número de saltos** (_hop count_).

[Insertar imagen sobre: tabla de vectores de distancia inicial con rutas directas]

### Ejemplo de intercambio
Inicialmente solo se conocen rutas directas. Tras el intercambio, cada router conoce la mejor ruta a todos los destinos.

[Insertar imagen sobre: proceso de intercambio de vectores de distancia entre routers]

[Insertar imagen sobre: tablas resultantes después del intercambio completo]

### Problema: Cuenta a infinito
- Cuando un enlace cae o aumenta su coste, los cambios tardan en propagarse.
- Puede no converger (actualizaciones circulares incrementando la métrica).

[Insertar imagen sobre: escenario de cuenta a infinito con routers en bucle]

### Soluciones a la cuenta a infinito
1. **Limitar el infinito** → en RIP, 16 saltos = inalcanzable.
2. **Horizonte dividido** (_split horizon_): no se anuncia una ruta por la interfaz por la que se aprendió.
3. **Horizonte dividido con respuesta envenenada**: se anuncia con distancia infinita.
4. **Actualizaciones forzadas** (_triggered updates_): ante un cambio, se difunde inmediatamente.

[Insertar imagen sobre: split horizon - R0 no anuncia 10.0.0.0/24 de vuelta a R1]

[Insertar imagen sobre: split horizon con poisoned reverse - R0 anuncia 10.0.0.0/24 con métrica infinita]

---

## 4. Encaminamiento en Internet

### Sistemas Autónomos (AS)
- **AS**: conjunto de redes y routers gestionados por una misma autoridad.
- **Routers internos**: usan protocolos **IGP** (Interior Gateway Protocol).
  - Solo conocen la organización de su AS.
- **Routers frontera** (_border routers_): usan protocolos **EGP** (Exterior Gateway Protocol).
  - Conocen el camino a otros AS, pero no su organización interna.

[Insertar imagen sobre: estructura de Internet con sistemas autónomos interconectados por border routers]

### Protocolos IGP (interior)
- **RIP** — Routing Information Protocol
- **OSPF** — Open Shortest Path First
- **IGRP** — Internal Gateway Routing Protocol (Cisco)

### Protocolos EGP (exterior)
- **EGP** — External Gateway Protocol
- **BGP** — Border Gateway Protocol

[Insertar imagen sobre: jerarquía de protocolos de encaminamiento IGP vs EGP]

---
