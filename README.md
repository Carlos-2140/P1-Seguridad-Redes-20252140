# Laboratorio de Seguridad de Redes - P1

**Video:** [Agregar enlace de YouTube u OneDrive](https://www.youtube.com/playlist?list=PLHu3QdN4_OEk)
Link: https://www.youtube.com/playlist?list=PLHu3QdN4_OEk  

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



## Nota de implementación

La configuración de FortiGate se realizó y se validó desde la GUI. 
