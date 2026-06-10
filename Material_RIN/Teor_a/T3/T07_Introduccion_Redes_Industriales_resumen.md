# T07 — Introducción a las Redes Industriales

## 1. Sistemas Industriales Distribuidos (SID)

[insertar imagen sobre arquitectura de sistemas industriales distribuidos]

**Definición:** Arquitectura de control y automatización donde múltiples dispositivos, sensores, actuadores y sistemas informáticos están interconectados para operar de manera descentralizada. Ofrece mayor flexibilidad, escalabilidad y eficiencia que los sistemas centralizados.

### Características
- **Descentralización**: múltiples dispositivos comparten la responsabilidad, no un único controlador central.
- **Interconectividad**: redes como Ethernet/IP, Modbus, Profibus o IIoT industrial.
- **Escalabilidad**: agregar dispositivos sin afectar la operación global.
- **Tolerancia a fallos**: al no depender de un único nodo, el sistema sigue funcionante ante fallos parciales.
- **Optimización de recursos**: uso eficiente de energía, maquinaria y mano de obra.
- **Automatización avanzada**: PLCs, SCADA, IIoT e Inteligencia Artificial.

### Aplicaciones
- Automatización de fábricas (producción y ensamblaje).
- Redes inteligentes (Smart Grid).
- Transporte y logística (almacenes, vehículos autónomos).
- Industria 4.0 (IoT, Big Data).
- Robótica industrial (control distribuido con múltiples robots).

### Ventajas
- Mayor eficiencia operativa.
- Reducción de costes de mantenimiento y producción.
- Mayor adaptabilidad a cambios.
- Mejora en recopilación y análisis de datos.

---

## 2. Redes Industriales

[insertar imagen sobre qué son las redes industriales y sus componentes]

**Definición:** Estructuras de comunicación automatizada que gestionan procesos industriales. Involucran actuadores, computadoras, máquinas, sensores, interfaces, medios de comunicación, fibra óptica, redes inalámbricas industriales y robots.

**Objetivo:** Transmitir y compartir datos para garantizar un funcionamiento eficiente de los procesos productivos.

**Protocolos principales:** PROFINET, SensorBus, DeviceBus, FieldBus, PROFIBUS, EtherNet/IP, DeviceNet, CANopen, EtherCAT, Modbus, AS-i, ControlNet.

### Desafíos
- Complejidad en la integración de sistemas heterogéneos.
- Ciberseguridad robusta.
- Capacitación especializada.

### Evolución del cableado
- **Modelo antiguo**: un cable físico por cada dispositivo → cuellos de botella.
- **Modelo actual**: un único medio físico maneja múltiples variables de comunicación.

### Niveles en la organización
- Nivel de entrada/salida (sensores/actuadores).
- Nivel de campo y proceso (PCs, PLCs).
- Nivel de control (controladores E/S).
- Nivel de gestión (controladores, transmisores, estaciones de trabajo).

### Clasificación por funcionalidad
- Redes a nivel de campo.
- Redes a nivel de control.
- Redes a nivel de información.

---

## 3. TI vs TO (Tecnología de la Información vs Tecnología Operacional)

[insertar imagen sobre convergencia TI-TO y edge computing]

**TI (Tecnología de la Información):** Entrega información cuando un profesional la solicita. Sistemas de datos para resolver problemas empresariales.

**TO (Tecnología Operacional):** Entrega información en un momento específico bajo una condición determinada. Controla equipos industriales (fabricación, energía, medicina, edificios). Trabaja con comandos que fluyen siguiendo un orden lógico preprogramado.

**Convergencia TI-TO:** Relacionada con el **edge computing** (trasladar recursos informáticos a la ubicación física del usuario o fuente de datos). Permite unificar sistemas de datos del área comercial y las operaciones, habilitando IA/ML para control de calidad y mantenimiento predictivo.

### Ventajas de las redes industriales
- Diagnóstico de problemas en tiempo real.
- Reducción de tiempos de inactividad.
- Reducción de gastos energéticos.
- Gestión remota.
- Aumento de productividad y seguridad (máquinas realizan tareas complejas/peligrosas).

---

## 4. Aplicaciones de las Redes Industriales

[insertar imagen sobre aplicaciones de RRII en empresas, supervisión y control]

1. **Redes en empresas**: conectan computadoras entre departamentos (LAN/WAN). Comunicación eficiente y prevención de accesos no autorizados.
2. **Redes en operaciones de negocio**: conectan sistemas en diferentes edificios/ubicaciones.
3. **Redes de supervisión**: conectan computadoras para supervisar otras computadoras y sistemas (manufactura).
4. **Redes de control de procesos**: transmiten datos entre unidades de control y medición. Baja sensibilidad electromagnética y técnicas de conexión prioritaria.

---

## 5. Tipos de Redes Industriales

[insertar imagen sobre clasificación de buses de campo]

### Definición de Bus
**Bus:** sistema de comunicación que transfiere datos entre dispositivos (ej. USB).
**Bus industrial:** transfiere datos entre componentes en los niveles de información, control y campo de una planta.

### Clasificación de buses de campo

| Criterio | Tipos |
|----------|-------|
| Amplio | Puede estar en cualquier nivel CIM |
| Estricto | SENSORBUS, DEVICEBUS, FIELDBUS, CONTROLBUS |

### Atendiendo a capacidades

| Tipo | Ejemplos |
|------|----------|
| **Sensor bus** | CAN, ASI, Seriplex, LonWorks |
| **Device bus** | DeviceNet, Profibus DP, SDS, Interbus-S |
| **Field bus** | Foundation Fieldbus, Profibus |
| **Control bus** | HSE (High-Speed Ethernet), ControlNet |

### Buses de alta velocidad y baja funcionalidad
- Integran dispositivos simples (fotocélulas, relés, actuadores).
- Aplicaciones en tiempo real en una pequeña zona (una máquina).
- Implementan capa física + capa de enlace.
- Ejemplos: **CAN** (automoción), **SDS** (sensores/actuadores basado en CAN), **ASI** (bus serie para sensores/actuadores).

---

## 6. Principales tipos de redes industriales (detalle)

### Sensor bus
[insertar imagen sobre arquitectura sensor bus]

Conecta redes de sensores digitales y actuadores. Transmite datos pequeños con bajo procesamiento. No cubre largas distancias. Lleva información de sensores a las tarjetas E/S del PLC. Redes típicas: ASI, CAN, Interbus.

### Device bus
[insertar imagen sobre device bus]

Intermidia entre sensor bus y fieldbus. Transmite señales analógicas y digitales del suelo de fábrica al PLC. Control de lazos y variables de proceso (presión, nivel, flujo, temperatura). Alcance hasta 500 m. Ejemplos: Modbus, Profibus DP, DeviceNet.

### Fieldbus
[insertar imagen sobre fieldbus]

Comando del rendimiento de la comunicación. Permite que señales de transmisores, posicionadores y analizadores lleguen al PLC. Varios instrumentos en red para control y monitoreo. Bajo costo de implementación. Ejemplos: Foundation Fieldbus, Profibus PA (petroquímica, minería).

### Redes Ethernet
[insertar imagen sobre Ethernet industrial]

Simplicidad, eficiencia y bajo costo. Usa switches, gateways, firewalls. Constante evolución. Usada tanto en industria como en ámbito doméstico.

### Redes TCP/IP
Conjunto de protocolos estándar para comunicación entre computadoras y sistemas automatizados. Ventajas: estandarización, interconectividad, enrutamiento, conexión a internet, robustez. Ejemplo: Modbus/TCP.

### PROFINET
[insertar imagen sobre PROFINET]

Solución de Ethernet Industrial abierta, basada en estándares internacionales. Desarrollada para intercambiar datos entre controladores y dispositivos. Estándar abierto con cientos de fabricantes. Define comunicación cíclica y acíclica (diagnósticos, seguridad funcional, alarmas). Coexiste con otros protocolos Ethernet (SNMP, MQTT, HTTP).

### PROFIBUS
Red digital que proporciona comunicación entre sensores de campo y controladores. Evolución: PROFIBUS FMS → PROFIBUS DP (_Decentralised Peripherals_) → PROFIBUS PA (_Process Automation_, 1998).

### EtherCAT
[insertar imagen sobre EtherCAT]

"Ethernet para Control de Automatización Tecnológica". Alto rendimiento en tiempo real y adquisición de datos. Mantenido por EtherCAT Technology Group (ETG). Estandarizado bajo IEC 61158. Desarrollado originalmente por Beckhoff Automation (basado en su Lightbus de los 80). Presentado en 2003, derechos cedidos al ETG en 2004.

### ControlNet
Usa el Protocolo Industrial Común (CIP) para las capas superiores del modelo OSI. Control confiable y de alta velocidad con transferencia de datos I/O programada. Mensajes críticos no dependientes del tiempo sin interferir en control. Dispositivos típicos: PLC, HMI, PCs, drives, robots, chasis I/O. Usado en aplicaciones redundantes.

---

## 7. Ethernet en la Industria

[insertar imagen sobre evolución de Ethernet en la industria]

### Historia
- A finales de los 90 y principios de los 2000, el fieldbus predominaba.
- Ethernet se inventó en 1973 en Xerox PARC (Robert Metcalfe, David Boggs, Chuck Thacker, Butler Lampson).
- Ventajas frente a otras redes:
  - Implementación más simple.
  - Costos reducidos.
  - Múltiples protocolos en entorno industrial.
  - Constante evolución.
  - Interoperable y escalable.
  - Aplicable en cualquier espacio.

### Importancia en Industria 4.0 e IIoT
[insertar imagen sobre Industria 4.0 e IIoT]

- La **Industria 4.0** es la cuarta revolución industrial: producción conectada al entorno digital, información compartida entre usuarios y máquinas.
- Requiere infraestructura de comunicación que abarque todas las máquinas, computadoras, robots y equipos.
- Posible gracias al **IIoT** (Internet Industrial de las Cosas) y **Big Data**.
- Ethernet e Internet son la base de esta conectividad.

### Trabajo remoto y Cobots
[insertar imagen sobre cobots en industria 4.0]

- **Cobots** (robots colaborativos): automatizan tareas poco ergonómicas, monótonas y repetitivas.
- Liberan trabajadores para tareas de mayor valor agregado.
- Ventajas: flexibilidad, fácil implementación, poco espacio, facilidad de programación.
- Ejemplo: ecosistema UR+ de Universal Robots (soluciones que aumentan la conectividad del cobot a redes industriales, mantenimiento predictivo).

---

*Fin del documento. Basado en T07-introducci_nRedesIndustriales.pdf — Introducción Redes Industriales, Robótica (14541).*
