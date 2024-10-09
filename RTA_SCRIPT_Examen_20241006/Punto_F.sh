#!/bin/bash

DIRECTORIO=~/repogit/UTNFRA_SO_1P2C_2024_Bianchi/RTA_ARCHIVOS_Examen_20241007
NOMBRE_ARCHIVO=Filtro_Avanzado.txt
IP_PUBLICA=$(curl -s ifconfig.me)
NOMBRE_USUARIO=$(whoami)
HASH_USUARIO=$(sudo grep $NOMBRE_USUARIO /etc/shadow | awk -F ':' '{print $2}')
DIR_REPO=~/repogit/UTNFRA_SO_1P2C_2024_Bianchi
URL_REPO=$(git -C $DIR_REPO remote get-url origin)

echo "Mi IP pública es: $IP_PUBLICA" > $DIRECTORIO/$NOMBRE_ARCHIVO
echo "Mi usuario es: $NOMBRE_USUARIO" >> $DIRECTORIO/$NOMBRE_ARCHIVO
echo "El Hash de mi Usuario es: $HASH_USUARIO" >> $DIRECTORIO/$NOMBRE_ARCHIVO
echo "La URL de mi repositorio es: $URL_REPO" >> $DIRECTORIO/$NOMBRE_ARCHIVO
