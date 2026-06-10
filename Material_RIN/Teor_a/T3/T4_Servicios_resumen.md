# Tema 4 — Servicios de Red

## 1. Definición

[insertar imagen sobre modelo cliente-servidor en servicios de red]

Los **servicios de red** son protocolos de software ejecutados en servidores que permiten a los dispositivos conectados compartir recursos, comunicarse, acceder a internet y gestionar la infraestructura tecnológica.

- Operan bajo un modelo **cliente-servidor**.
- Son fundamentales tanto en redes locales (LAN) como en redes globales (Internet).

---

## 2. Principales servicios de red

[insertar imagen sobre clasificación de servicios de red]

| Categoría | Servicios | Descripción |
|-----------|-----------|-------------|
| **Infraestructura** | DNS, DHCP | Conectividad y funcionamiento básico de la red |
| **Internet y Comunicación** | WWW (HTTP/HTTPS), Correo (SMTP/POP3/IMAP), FTP | Navegación web, email, transferencia de archivos |
| **Acceso y Gestión** | SSH, Telnet, Directorio (Active Directory) | Gestión remota de equipos, administración de usuarios y recursos |
| **Aplicación** | SaaS, Mensajería, Bases de datos, Streaming | Aplicaciones en la nube y servicios finales |

---

## 3. DNS (Domain Name System)

[insertar imagen sobre jerarquía del DNS]

### FQDN (_Fully Qualified Domain Name_)

```
www.upv.edu.es
  ↑    ↑    ↑  ↑
Equipo |    |  País
       Org.  Rol
```

- **DNS** (RFC 1034 y 1035): traduce nombres de dominio a IP y viceversa.
- Estructura **jerárquica**, bases de datos **distribuidas**.
- Normalmente ejecutan **BIND** (_Berkeley Internet Domain Name_).

### Ámbitos de participación del DNS
- Web: `http://www.icesi.edu.co`
- Email: `pepito.perez@icesi.edu.co`
- FTP: `ftp://ftp.icesi.edu.co`
- Host: `simbi.icesi.edu.co`

### Descentralización

[insertar imagen sobre descentralización del DNS]

- **Root Servers**: 13 servidores raíz (A–M), mayoritariamente en USA.
- **TLD Servers**: dominios de nivel superior (.com, .es, etc.).
- **Authoritative DNS Servers**: servidores autoritativos por dominio.

### Resolución de nombres

[insertar imagen sobre resolución de nombres DNS]

- **Query interactivo**: el servidor redirige al cliente progresivamente.
- **Query recursivo**: el servidor resuelve completamente y devuelve la IP.
- **Caching**: importante para eficiencia.

### Tipos de registros DNS

| Registro | Propósito |
|----------|-----------|
| **A** | Nombre → IPv4 |
| **AAAA** | Nombre → IPv6 |
| **MX** | Servidor de correo |
| **CNAME** | Alias / nombre canónico |
| **TXT** | Información textual |

### Consulta manual
- `nslookup`: permite consultar un servidor DNS específico para resolver un nombre.

### Zonas forwarder
- Un DNS puede almacenar 1 o N zonas _forwarder_.
- Por cada zona se crean registros tipo A, MX, CNAME, TXT, etc.

### DNS Internos

[insertar imagen sobre arquitectura DNS interno]

- Resuelven nombres dentro de una red local (empresa u hogar).
- Conocen las IPs privadas de los dispositivos internos.
- Reenvían consultas no resueltas al ISP/Internet.

### DNS Externos o Autoritativos

[insertar imagen sobre DNS autoritativos]

- Visibles desde Internet.
- Solo contienen registros de servicios públicos.
- Al registrar un dominio se especifican 2 DNS autoritativos.

### Obtención de un dominio

[insertar imagen sobre proceso de registro de dominio]

- **ICANN** (_Internet Corporation for Assigned Names and Numbers_) acredita **REGISTRARs**.
- El REGISTRAR verifica la unicidad del nombre y requiere:
  - Nombre y dirección IP de los 2 DNS autoritativos.
  - Especificación de servidores: Web, Correo, FTP, etc.

---

## 4. DHCP (Dynamic Host Configuration Protocol)

[insertar imagen sobre funcionamiento del protocolo DHCP]

### Beneficios
- Administración centralizada de la configuración IP.
- Configuración de hosts consistente.
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

**Cambio de servidor:**
```
Cliente → DHCPREQUEST → Servidor
Cliente ← DHCPNACK    ← Servidor
Cliente → DHCPDISCOVER → Servidor (nuevo)
Cliente ← DHCPOFFER   ← Servidor
Cliente → DHCPREQUEST → Servidor
Cliente ← DHCPACK     ← Servidor
```

### Mensajes DHCP

| Mensaje | Significado |
|---------|-------------|
| DHCPDISCOVER | El cliente pide una dirección IP |
| DHCPOFFER | El servidor ofrece una concesión |
| DHCPREQUEST | Solicitud de concesión específica |
| DHCPACK | Confirmación de concesión |
| DHCPDECLINE | Rechazo de la dirección ofrecida |
| DHCPNACK | Denegación de la concesión |
| DHCPRELEASE | Liberación de la concesión |
| DHCPINFORM | Solicitud de configuración adicional |

### Puertos
- Cliente: **UDP 68**
- Servidor: **UDP 67**

### Estructura del mensaje DHCP
- Tipo de mensaje, tipo/longitud de dirección HW, saltos, ID de transacción, segundos, indicadores.
- Dirección IP del cliente, su IP, IP del servidor DHCP, IP del gateway.
- Dirección HW del cliente (16 bytes), nombre de host del servidor (64 bytes), archivo de inicio (128 bytes).
- _Magic Cookie_ y opciones DHCP.

### Métodos de configuración
- **Servidores DHCP**: asignación automática.
- **Agentes DHCP de relevo**: reenvían peticiones entre subredes.
- **BOOTP**: protocolo predecesor.

### Ámbitos DHCP
- Definen rangos de direcciones IP asignables.
- Se pueden crear superámbitos combinando ámbitos múltiples.
- Especifican la duración de la concesión.

### Exclusión de direcciones
Se excluyen manualmente direcciones para:
- Encaminadores (routers)
- Firewalls
- Servidores (archivos, impresión, aplicación)
- Puertas de enlace

---

*Fin del documento. Basado en T4_Servicios.pdf — Servicios de Red, Robótica (14541).*
