# Tema 2: Introducción a las redes de computadores e Internet

## 1. ¿Qué es Internet?

### 1.1 Componentes esenciales de una red de computadores

#### Componentes físicos de una red

Una red de computadores está formada por:

- **Hosts o sistemas terminales**: son los equipos que se conectan a la red y ejecutan las aplicaciones (ordenadores, servidores, dispositivos móviles).
- **Enlaces de comunicación**: son los canales que conectan los hosts entre sí. Utilizan un **medio de transmisión** que puede ser:
  - **Medios guiados**:
    - **Par trenzado**: dos cables de cobre aislados. Existen diferentes categorías (3, 5, 5e, 6, 6a, 7, 7A).
    - **Cable coaxial**: dos conductores concéntricos. Puede ser bidireccional, de banda base (canal único) o banda ancha (varios canales en el mismo cable).
    - **Fibra óptica**: de plástico o vidrio. Transmite luz. Alta velocidad, baja tasa de error, inmune al ruido electromagnético.
  - **Medios no guiados**:
    - **Ondas de radio**: transmisión inalámbrica mediante antenas. Sus características dependen de la banda del espectro electromagnético. Es sensible a interferencias y absorción por objetos.
- **Dispositivos de conmutación**: reenvían los paquetes hacia sus destinos finales. Los más utilizados son:
  - **Routers** (en el núcleo de la red)
  - **Switches** (en las redes de acceso)
- **Subred**: basada en alguna tecnología de red que determina sus características. Puede usar medio compartido (difusión) o dispositivos de interconexión (conmutación).

![insertar imagen sobre componentes físicos de una red de computadores: hosts, enlaces y dispositivos de conmutación]()

#### Interconexión de redes

Cuando se conectan varias redes entre sí mediante un dispositivo de interconexión denominado **pasarela** o **router**, se forma una **inter-red**. **Internet** es la red de redes resultante de interconectar múltiples redes a nivel mundial.

![insertar imagen sobre interconexión de redes mediante routers formando una inter-red]()

### 1.2 Componentes lógicos de una red

Para que la red funcione a nivel lógico se necesita:

- **Protocolos**: conjunto de reglas que regulan la comunicación entre dos partes. Se basan en un modelo pregunta-respuesta.

![insertar imagen sobre ejemplo de protocolo de comunicación con modelo pregunta-respuesta]()

  Definen:
  - El formato (sintaxis), la semántica y el orden de los mensajes intercambiados entre entidades de red.
  - Las acciones a realizar en la transmisión y recepción de los mensajes.
- **Direccionamiento**: poder identificar a cada uno de los hosts que se comunican mediante **direcciones IP**:
  - **IPv4**: 32 bits, expresados en notación decimal (ej. 158.52.4.123).
  - **IPv6**: 128 bits, expresados en hexadecimal (ej. 2001:0db8:85a3::1319:8a2e:0370:7344).
  - A las direcciones IP se les puede asociar un nombre (ej. www.google.com).

![insertar imagen sobre direcciones IP y resolución de nombres en Internet]()

### 1.3 Red de conmutación de paquetes

Si un host desea enviar un bloque de datos (paquete) a otro situado en otra subred, lo hace llegar al router adecuado, que lo recibe y lo retransmite a través de otra subred, y así sucesivamente hasta alcanzar el host destino.

Características:
- Cada "salto" cuesta un tiempo (transmitir el paquete y procesarlo).
- El router debe almacenar el paquete (**Store and Forward**). Si no tiene memoria disponible, puede descartarlo.
- La ruta se elige de forma distribuida: cada router toma decisiones en función de su entorno; el origen no sabe dónde está el paquete tras el primer salto.

![insertar imagen sobre conmutación de paquetes: host origen, routers intermedios y host destino]()

### 1.4 Estructura comercial de Internet (ISPs)

- Los sistemas terminales se conectan a Internet a través de, al menos, un **Proveedor de Servicios de Internet (ISP)**.
- Los ISP deben interconectarse entre sí para que cualquier par de hosts pueda comunicarse.
- La estructura resultante es muy compleja (varios millones de proveedores) y tiene una estructura jerárquica:

#### ISP de Nivel 1 (Tier 1)
- Redes troncales (backbone) con cobertura nacional e internacional.
- Ejemplos: Level3, Sprint, AT&T, NTT.
- Se conectan entre sí como iguales (no pagan por tránsito).
- Velocidad mínima de 622 Mbps, comúnmente 2.5 Gbps a 100 Gbps.
- Se conectan a un gran número de ISP de nivel 2.
- También existen **grandes distribuidores de contenidos** (Google, Akamai) que se conectan directamente.

#### ISP de Nivel 2 (Tier 2)
- Más pequeños que los de nivel 1: cobertura regional o nacional.
- Conectados al menos a un ISP de nivel 1 (proveedor), al que pagan por sus servicios.
- También se conectan entre ellos mediante acuerdos de **peering** o en los **IXP** (Internet eXchange Points).

#### ISP de Nivel 3 o locales
- Clientes de los ISP de nivel 1 o nivel 2.
- Son las redes de acceso, las más próximas a los usuarios finales.

![insertar imagen sobre jerarquía de ISPs: nivel 1, nivel 2, nivel 3 e IXP]()

#### Ejemplo: RedIRIS
- Red española para la interconexión de los recursos informáticos de universidades y centros de investigación.
- Dispone de enlaces externos de hasta 100 Gbps.

### 1.5 Resumen de Internet

Internet es una red de comunicación de datos:
- Formada por múltiples redes interconectadas que emplean routers y conmutación de paquetes.
- Todos los sistemas utilizan el mismo conjunto de protocolos de comunicación: **TCP/IP**.
- Tienen un esquema de direccionamiento común: **direcciones IP**.
- A nivel comercial se estructura en diferentes **ISP**.

![insertar imagen sobre estructura general de Internet como red de redes]()

---

## 2. La frontera de la red (El borde de la red)

### Estructura de Internet

- **La frontera de la red**: hosts (clientes y servidores), redes de acceso y medios físicos (enlaces cableados/inalámbricos).
- **El núcleo de la red**: routers interconectados formando una red de redes.

![insertar imagen sobre frontera y núcleo de la red: hosts, redes de acceso y routers del núcleo]()

### Aplicaciones distribuidas

- Las redes permiten aplicaciones distribuidas donde varios procesos colaboran para ofrecer un servicio.
- Estas aplicaciones se ejecutan en los **sistemas terminales** u **hosts**, que pueden clasificarse en **clientes** y **servidores**.

### 2.1 Tecnologías de acceso a Internet

Para conectar un ordenador al primer router que le permite acceder a Internet se necesita una tecnología de acceso y un medio físico compatible.

Tecnologías más comunes:
- **DSL** (Digital Subscriber Line)
- **Cable HFC** (Hybrid Fiber Coaxial Cable)
- **FTTH** (Fiber To The Home)
- **Ethernet**
- **Acceso inalámbrico**:
  - **IEEE 802.11 (WiFi)**
  - **WiMax**
  - **Telefonía móvil**

La tecnología establece un límite a la máxima velocidad de transmisión disponible en la conexión (aunque no es el único factor).

![insertar imagen sobre tecnologías de acceso a Internet: DSL, cable HFC, FTTH, WiFi]()

---

## 3. El núcleo de la red. Técnicas de conmutación

El núcleo de la red es una malla de encaminadores interconectados. El objetivo de una red es transferir datos entre los sistemas conectados. Hay dos formas fundamentales de mover la información:

### 3.1 Conmutación de circuito

- Se reserva un conjunto de enlaces (circuito) por conversación.
- **Tres fases**:
  1. Establecimiento de conexión.
  2. Transferencia de datos.
  3. Cierre.
- **Recursos dedicados**: el circuito no se comparte. Una vez establecido, los recursos permanecen asociados al circuito se transfieran datos o no.
- Por un enlace pueden pasar varios circuitos.
- Se diseñó para redes telefónicas. No es óptimo para comunicación entre computadores porque estas generan tráfico en ráfagas (periodos de actividad/inactividad), a diferencia de una conversación telefónica que es más o menos continua.

![insertar imagen sobre conmutación de circuito: establecimiento, transferencia y cierre]()

### 3.2 Conmutación de paquete

#### Concepto de paquete

- Las aplicaciones generan mensajes de longitud arbitraria.
- Por motivos de eficiencia, las redes limitan el tamaño máximo de los paquetes (ej. 1500 bytes = 12000 bits).
- Los mensajes mayores deben fragmentarse en una secuencia de paquetes.

#### Estructura de un paquete

- **Cabecera**: información de control (dirección remitente y destinatario).
- **Datos**: contenido del mensaje.
- **Paquete = cabecera + datos**.

![insertar imagen sobre estructura de un paquete: cabecera (dirección origen y destino) y datos]()

#### Funcionamiento

- No se reservan recursos en la red.
- En los dispositivos de conmutación:
  - **Almacenamiento y reenvío (Store and Forward)**: provoca retardo.
  - Se necesitan **colas** en los enlaces de salida, que pueden provocar retardo.
  - **Posible pérdida de paquetes**: las colas (buffers) de salida tienen capacidad finita; los paquetes que llegan a una cola llena se descartan.

![insertar imagen sobre store and forward en un router con colas de salida]()

---

## 4. Retardos en redes de conmutación de paquete

### 4.1 Retardos asociados a los enlaces

#### Tiempo de transmisión (ttrans)

- Cada enlace tiene una capacidad medida en bits por segundo (bps).
- Depende de la velocidad de transmisión del enlace (vtrans) y de la longitud del paquete en bits (L):
  - **ttrans = L / vtrans**
- Ejemplo: L = 1500 Bytes = 12000 bits
  - vtrans = 1 Mbps → ttrans = 12 ms
  - vtrans = 100 Mbps → ttrans = 0.12 ms
  - vtrans = 100 MBps → ttrans = 0.015 ms

#### Tiempo de propagación (tprop)

- Depende de la distancia (D metros) y la velocidad de propagación de las ondas en el medio (vprop, de 2·10⁸ m/s a 3·10⁸ m/s):
  - **tprop = D / vprop**
- A mayor longitud del enlace, mayor tiempo de propagación para la misma velocidad de propagación.

![insertar imagen sobre diferencia entre tiempo de transmisión y tiempo de propagación en un enlace]()

#### Ejemplo (Kurose R18)

Un paquete de L = 1000 bytes (8000 bits) se envía a través de un enlace de 2500 km:
- vprop = 2.5 × 10⁸ m/s
- vtrans = 2 Mbps
- **ttrans** = 8000 / (2 × 10⁶) = 4 × 10⁻³ s
- **tprop** = (25 × 10⁵) / (2.5 × 10⁸) = 10⁻² s
- **Tiempo total** = ttrans + tprop = 14 × 10⁻³ s

![insertar imagen sobre cronograma del ejemplo Kurose: emisión y llegada de bits]()

### 4.2 Retardos asociados a los dispositivos de conmutación

#### Tiempo de procesamiento (tproc)

- Tiempo necesario para tomar una decisión de encaminamiento del paquete.
- Depende del dispositivo.

#### Tiempo de espera en cola de salida (tcola)

- Depende del tráfico y de las velocidades de transmisión de los enlaces.

### Resumen del viaje de un paquete

- **Hasta llegar al primer router**: tA = ttrans + tprop
- **Por cada router que haya que atravesar**: trouter = tproc + tcola + ttrans + tprop

![insertar imagen sobre retardos acumulados en el viaje de un paquete: host, router, enlaces]()

---

## 5. Arquitecturas de comunicación

### 5.1 Arquitectura en capas o niveles

La complejidad de las comunicaciones aconseja el empleo de modelos jerárquicos:
- Se dividen las tareas en diferentes **capas o niveles**.
- Cada nivel soluciona un objetivo particular y debe ser fácilmente reemplazable sin afectar al conjunto.
- Para cada nivel se emplean uno o más protocolos específicos.
- **Modularización**: facilita la implementación, el mantenimiento y la actualización.

Este modelo jerárquico se denomina **arquitectura de comunicación o de red**.

![insertar imagen sobre analogía de la partida de ajedrez como ejemplo de arquitectura en capas]()



### Comunicación entre niveles

- Cada nivel proporciona un servicio al nivel superior.
- Solo hay comunicación entre niveles adyacentes.

![insertar imagen sobre arquitectura de comunicación en capas con interacción entre niveles adyacentes]()

### 5.2 Modelo TCP/IP (5 niveles)

Es la arquitectura de Internet:

| Nivel | Nombre | Función |
|-------|--------|---------|
| 5 | **Aplicación** | Protocolos para aplicaciones de red (HTTP, SMTP, IMAP, etc.) |
| 4 | **Transporte** | Transmisión de información entre dos procesos a través de la red. Protocolos: TCP y UDP |
| 3 | **Red** | Encamina paquetes desde el host origen al host destino, eligiendo la ruta a través de la red |
| 2 | **Enlace** | Traslada tramas de un nodo (host o router) al siguiente nodo de la ruta |
| 1 | **Físico** | Transmisión de bits sobre un enlace de comunicación. Define el medio de transmisión y la codificación de la señal |

- Se pueden utilizar diferentes protocolos de nivel físico y de nivel de enlace a lo largo de la ruta.

![insertar imagen sobre pila de protocolos TCP/IP con los 5 niveles y ejemplos de protocolos]()

### 5.3 Modelo OSI (7 niveles)

El modelo OSI (Open Systems Interconnection) de ISO añade dos niveles adicionales respecto a TCP/IP:

| Nivel | Nombre | Función |
|-------|--------|---------|
| 7 | Aplicación | |
| 6 | **Presentación** | Representación e interpretación del significado de los datos (encriptación, compresión, etc.) |
| 5 | **Sesión** | Sincronización y recuperación del flujo de datos |
| 4 | Transporte | |
| 3 | Red | |
| 2 | Enlace | |
| 1 | Físico | |

La arquitectura TCP/IP no dispone de las capas de sesión y presentación. Si se requieren estos servicios, deben incorporarse a la aplicación.

![insertar imagen sobre modelo OSI de 7 capas frente a modelo TCP/IP de 5 capas]()

### 5.4 Encapsulamiento en TCP/IP

Cada nivel añade su propia cabecera a los datos que recibe del nivel superior:

```
Aplicación:  Mensaje (M)
Transporte:  Segmento TCP / Datagrama UDP (cabecera T + M)
Red (IP):    Datagrama o Paquete IP (cabecera R + T + M)
Enlace:      Trama (cabecera E + R + T + M)
Físico:      Bits (110110101101...)
```

![insertar imagen sobre proceso de encapsulamiento en TCP/IP: mensaje, segmento, datagrama, trama, bits]()

### 5.5 Organismos de estandarización

- **Niveles 3-5 (TCP/IP)**: desarrollados por la **IETF** (Internet Engineering Task Force) mediante documentos **RFC** (Request for Comments).
  - IETF: http://www.ietf.org
  - RFC Editor: https://www.rfc-editor.org/
- **Niveles 1 y 2**: desarrollados principalmente por el **IEEE** (Institute of Electrical and Electronics Engineers).
