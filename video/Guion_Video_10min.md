# Guion del video demostrativo (máximo 10 minutos)

## 0:00-0:30 - Presentación
- Mostrar fecha y hora del sistema.
- Mostrar rostro y voz.
- Indicar nombre, matrícula y propósito del laboratorio.

## 0:30-1:15 - Topología
- Mostrar GNS3.
- Señalar FortiGate, switch, USER, WEB y DB.
- Señalar VLAN 10, 20 y 30.

## 1:15-2:15 - Red y FortiGate
- GUI: interfaces VLAN.
- DHCP de VLAN 10.
- Ruta por defecto.
- Política USERS-TO-INTERNET con NAT.

## 2:15-3:30 - Políticas de mínimo privilegio
- USERS -> WEB HTTPS/443 permitido.
- USERS -> DB/3306 denegado.
- WEB -> DB/3306 permitido.
- Mostrar que WEB no tiene otra regla hacia DB.

## 3:30-5:15 - DPI + SQL Injection
- Mostrar custom-deep-inspection.
- Mostrar IPS-SQLI-QUARANTINE.
- Ejecutar payload controlado.
- Mostrar Log & Report -> Intrusion Prevention.
- Mostrar cuarentena de la IP atacante.

## 5:15-6:30 - Bloqueo de .exe
- Intentar descargar test.exe desde el WEB.
- Mostrar File Filter log con Action=blocked.

## 6:30-7:30 - Rate limiting
- Mostrar LIMIT-WEB = 2 Mbps.
- Mostrar RATE-LIMIT-WEB usando ese shaper.
- Opcional: descargar archivo de 10 MB y mostrar velocidad.

## 7:30-8:45 - Protección DoS
- Mostrar PROTECT-WEB-DOS y tcp_syn_flood threshold 100.
- Ejecutar prueba breve en el laboratorio.
- Mostrar Log & Report -> Anomaly con tcp_syn_flood.

## 8:45-9:30 - Switch
- Mostrar puertos VLAN 10/20/30.
- Mostrar puertos no usados en VLAN 999.

## 9:30-10:00 - Cierre
- Resumir que se validaron segmentación, mínimo privilegio, DPI, IPS, cuarentena, filtrado de archivos, rate limiting y DoS.
