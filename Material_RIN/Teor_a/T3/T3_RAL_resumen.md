# Tema 3 — Redes de Área Local (RAL)

## 1. TCP/IP

[insertar imagen sobre pila de protocolos TCP/IP y sus capas]

**IP (Internet Protocol):** Obtiene y define la dirección IP del destino. Es como un número de teléfono asignado a un dispositivo.

**TCP (Transmission Control Protocol):** Transporta y enruta los datos a través de la red, garantizando la entrega al destino que IP ha definido. Es como la tecnología que permite "llamar" a ese número.

### Capas del modelo TCP/IP
- Capa de enlace de datos
- Capa de Internet
- Capa de transporte
- Capa de aplicación

---

## 2. TCP

[insertar imagen sobre funcionamiento de TCP orientado a conexión]

- Protocolo de la capa de transporte, **orientado a conexión**.
- Hace fiable la comunicación: si falta un paquete o hay error, solicita el reenvío.
- Solo entrega los datos al nivel superior si están completos.

---

## 3. UDP

[insertar imagen sobre comparativa TCP vs UDP]

- Protocolo sin conexión, más rápido que TCP.
- No garantiza recepción ni orden de los datos.
- Adecuado cuando la velocidad importa más que la fiabilidad: juegos en línea, streaming, DNS.

| TCP | UDP |
|-----|-----|
| Orientado a conexión | Sin conexión |
| Fiable (reenvía paquetes perdidos) | No fiable |
| Entrega ordenada | Sin orden garantizado |
| Mayor latencia | Baja latencia |

---

## 4. Direccionamiento IP

[insertar imagen sobre formato de dirección IP de 32 bits]

- Cada dispositivo en una red tiene un **identificador único**: la dirección IP.
- Dirección **MAC** (_Media Access Control_): dirección física única de 48 bits asignada por el fabricante de la tarjeta de red.

### Representación IP
- Secuencia de **32 bits** (4 octetos).
- Notación decimal punteada: `192.168.1.2`.
- Cada octeto: 8 bits → valores de 0 a 255.

### IP Dinámica
- Asignada por un servidor **DHCP** al conectarse.
- Cambia cada vez que el dispositivo se reconecta. Típica en hogares.

### IP Fija
- No cambia. Usada en empresas para identificar servidores, administradores, etc.

---

## 5. Direccionamiento IP con Clase

[insertar imagen sobre estructura de direcciones IP con clase]

Cada IP tiene dos partes: **red** y **host**. Los octetos dedicados a cada una definen la clase.

### Clase A
- Red: 1.ᵉʳ octeto. Host: 3 octetos restantes.
- 1.ᵉʳ bit siempre `0`.
- Rango: 1–126.
- Hasta ~16M hosts por red.

### Clase B
- Red: 1.ᵉʳ y 2.º octeto. Host: 3.ᵉʳ y 4.º octeto.
- 1.ᵉʳs bits siempre `10`.
- Rango: 128–191.
- Redes de tamaño moderado a grande.

### Clase C
- Red: 1.ᵉʳ, 2.º y 3.ᵉʳ octeto. Host: 4.º octeto.
- 1.ᵉʳs bits siempre `110`.
- Rango: 192–223.
- Máximo 254 hosts por red. Uso más frecuente.

### Clase D
- Para **multicast**: un paquete se envía a un grupo predefinido de IPs.
- 1.ᵉʳs bits siempre `1110`.
- Rango: 224–239.

### Clase E
- Reservada para investigación (IETF).
- Rango: 240–255.

### Resumen de clases

| Clase | Rango (1.ᵉʳ octeto) |
|-------|---------------------|
| A | 1–126 |
| B | 128–191 |
| C | 192–223 |
| D | 224–239 |
| E | 240–255 |

### Direcciones de redes privadas

| Clase | Rango |
|-------|-------|
| A | 10.0.0.0 – 10.255.255.255 |
| B | 172.16.0.0 – 172.31.255.255 |
| C | 192.168.0.0 – 192.168.255.255 |

### Direcciones de red y especiales
- **Dirección de red**: todos los bits de host a 0 (ej. `113.0.0.0` en clase A).
- **Dirección de difusión (_broadcast_)**: todos los bits de host a 1.
- **Dirección de multidifusión**: todos los bits de red a 1.

---

## 6. CIDR (Enrutamiento sin Clases)

[insertar imagen sobre notación CIDR y máscaras de subred]

- Reemplazó el direccionamiento por clases para mayor flexibilidad.
- **Notación de prefijo**: `192.168.1.0/24` → los primeros 24 bits son la red.
- Permite crear redes de cualquier tamaño.
- **Agregación de rutas (_supernetting_)**: una entrada en la tabla de enrutamiento representa múltiples redes.

### Máscaras comunes

| Prefijo CIDR | Máscara | Hosts útiles |
|-------------|---------|-------------|
| /30 | 255.255.255.252 | 2 |
| /28 | 255.255.255.240 | 14 |
| /24 | 255.255.255.0 | 254 |
| /16 | 255.255.0.0 | 65.534 |

---

## 7. DNS (Domain Name System)

[insertar imagen sobre jerarquía y funcionamiento del DNS]

- Traduce nombres de dominio (FQDN) a direcciones IP y viceversa.
- Estructura **jerárquica** y bases de datos **distribuidas**.
- Normalmente ejecutan **BIND** (_Berkeley Internet Domain Name_).

### Estructura de un FQDN

```
www.upv.edu.es
  ↑    ↑    ↑  ↑
Equipo |    |  País
       Org.  Rol
```

### Componentes del DNS
- **Root Servers**: 13 servidores raíz (A–M), mayoría en USA.
- **TLD Servers**: servidores de dominio de nivel superior (.com, .es, etc.).
- **Authoritative DNS Servers**: servidores autoritativos para un dominio.

### Tipos de resolución
- **Consulta interactiva**: el servidor consulta a otros y redirige al cliente.
- **Consulta recursiva**: el servidor resuelve completamente y devuelve la respuesta.

### Registros DNS
- **A**: nombre → IPv4
- **AAAA**: nombre → IPv6
- **MX**: servidor de correo
- **CNAME**: alias
- **TXT**: texto descriptivo

### DNS Internos vs Externos
- **DNS Interno**: resuelve nombres dentro de una red local (compañía). Conoce IPs privadas.
- **DNS Externo / Autoritativo**: visible desde Internet. Solo contiene registros de servicios públicos.
- Los DNS autoritativos se configuran al registrar un dominio a través de un **REGISTRAR** acreditado por **ICANN**.

[insertar imagen sobre diagrama de secuencia DNS]

### Comando útil
- `nslookup`: consulta manual a un servidor DNS.

---

## 8. DHCP (Dynamic Host Configuration Protocol)

[insertar imagen sobre funcionamiento de DHCP]

### Beneficios
- Administración centralizada de configuración IP.
- Configuración consistente.
- Flexibilidad y escalabilidad.

### Funcionamiento

**Concesión inicial:**
```
Cliente → DHCPDISCOVER → Servidor
Cliente ← DHCPOFFER    ← Servidor
Cliente → DHCPREQUEST  → Servidor
Cliente ← DHCPACK      ← Servidor
```

**Renovación:**
```
Cliente → DHCPREQUEST → Servidor
Cliente ← DHCPACK     ← Servidor
```

### Mensajes DHCP
| Mensaje | Significado |
|---------|-------------|
| DHCPDISCOVER | El cliente pide una IP |
| DHCPOFFER | El servidor ofrece una concesión |
| DHCPREQUEST | El cliente solicita una concesión específica |
| DHCPACK | El servidor confirma la concesión |
| DHCPDECLINE | El cliente rechaza la IP ofrecida |
| DHCPNACK | El servidor deniega la concesión |
| DHCPRELEASE | El cliente libera la concesión |
| DHCPINFORM | El cliente pide configuración adicional |

### Puertos
- Cliente: **UDP 68**
- Servidor: **UDP 67**

### Métodos de configuración
- **Servidores DHCP**: asignan IPs automáticamente.
- **Agentes DHCP de relevo**: reenvían peticiones entre subredes.
- **BOOTP**: protocolo predecesor.

### Ámbitos DHCP
- Definen rangos de direcciones IP asignables.
- Se pueden excluir direcciones manualmente (routers, firewalls, servidores).
- Se pueden crear superámbitos combinando múltiples ámbitos.

---


