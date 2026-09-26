#!/usr/bin/env bash
# Ejecutar únicamente dentro del laboratorio propio de GNS3.
WEB=10.21.40.130
DB=10.21.40.146

echo '[1] HTTPS normal'
curl -k --max-time 15 https://$WEB

echo '[2] SQL Injection de prueba'
curl -k --connect-timeout 5 --max-time 15 "https://$WEB/?id=1%27%20OR%20%271%27=%271--%20" || true

echo '[3] DB 3306 desde USER: debe bloquearse'
nc -vz -w 5 $DB 3306 || true

echo '[4] Descarga .exe controlada: debe bloquearse cuando File Filter esté activo'
curl -k -L --max-time 20 -o /tmp/test.exe https://$WEB/test.exe || true

echo '[5] SYN flood controlado, 3 segundos, solo laboratorio'
# Requiere hping3; descomentar durante la demostración.
# timeout 3 sudo hping3 -S -p 443 -i u5000 $WEB
