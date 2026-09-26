# Laboratorio de Seguridad de Redes - P1

**Video:** [Agregar enlace de YouTube u OneDrive](https://www.youtube.com/playlist?list=PLHu3QdN4_OEk)


## Información

- **Estudiante:** Carlos Ariel Rodriguez V
- **Matrícula:** 2025-2140
- **Práctica:** P1
- **Plataforma:** GNS3
- **Firewall:** FortiGate 7.0.9
- **Servidores:** Ubuntu Server 24.04

## Propósito

El propósito de este laboratorio es diseñar, implementar y validar una infraestructura segmentada y protegida utilizando GNS3 y FortiGate. La solución separa usuarios, servidor web y servidor de base de datos mediante VLAN independientes y aplica controles de seguridad basados en mínimo privilegio, inspección de tráfico y defensa en profundidad.

Se implementaron ruta por defecto, NAT, DHCP, políticas de firewall, HTTPS, DPI, IPS con detección de SQL Injection, bloqueo y cuarentena del atacante, filtrado de ejecutables, rate limiting y protección contra SYN flood.

## Topología

![Topología lógica](diagramas/topologia-logica.svg)

## Direccionamiento

| VLAN | Segmento | Red | Gateway | Host principal |
|---|---|---|---|---|
| 10 | USERS | 10.21.40.0/25 | 10.21.40.1 | DHCP 10.21.40.10-120 |
| 20 | WEB | 10.21.40.128/28 | 10.21.40.129 | 10.21.40.130 |
| 30 | DB | 10.21.40.144/28 | 10.21.40.145 | 10.21.40.146 |
| 999 | UNUSED | Sin L3 | - | Puertos no utilizados |

## Controles implementados

- Ruta por defecto `0.0.0.0/0 -> 192.168.100.1`.
- NAT para salida de USERS hacia Internet.
- VLAN 10 con DHCP.
- USERS -> WEB permitido únicamente por HTTPS/443.
- USERS -> DB/3306 bloqueado y registrado.
- WEB -> DB permitido únicamente por MariaDB/3306.
- DPI con perfil `custom-deep-inspection` en modo Protecting SSL Server.
- IPS `IPS-SQLI-QUARANTINE` con firma `HTTP.URI.SQL.Injection`.
- Cuarentena del origen durante 5 minutos.
- File Filter `BLOCK-EXE` para ejecutables.
- Traffic Shaper `LIMIT-WEB` a 2 Mbps.
- DoS Policy `PROTECT-WEB-DOS` con `tcp_syn_flood`.
- VLAN 999 para puertos del switch no utilizados.

## Documentación

- [Informe principal en Markdown](docs/Informe_Laboratorio.md)\n- Informe Word: `docs/Informe_Laboratorio_20252140_P1.docx` (archivo binario)
- [Guion del video](video/Guion_Video_10min.md)
- [Configuraciones](configs/)
- [Scripts y pruebas](scripts/)
- [Evidencias](capturas/)

## Evidencias destacadas

![Ruta por defecto](capturas/02-ruta-default.png)

![SQL Injection bloqueada](capturas/07-ips-log-sqli.png)

![EXE bloqueado](capturas/09-file-filter-log.png)

![SYN flood detectado](capturas/12-dos-log.png)

## Nota de implementación

La configuración de FortiGate se realizó y se validó desde la GUI. Durante el troubleshooting se utilizó la consola únicamente para recuperar acceso administrativo cuando fue necesario. La evidencia final se presenta desde la GUI.
