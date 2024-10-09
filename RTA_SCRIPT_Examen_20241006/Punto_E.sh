#!/bin/bash

RUTA_DESTINO=~/repogit/UTNFRA_SO_1P2C_2024_Bianchi/RTA_ARCHIVOS_Examen_20241007

ARCHIVO=Filtro_Basico.txt

sudo cat /proc/meminfo | grep "MemTotal" > $RUTA_DESTINO/$ARCHIVO

sudo dmidecode -t chassis | grep "Manufacturer" | awk '{print $0}' >> $RUTA_DESTINO/$ARCHIVO

sudo dmidecode -t chassis | grep "Chassis" | awk '{print $1,$2}' >> $RUTA_DESTINO/$ARCHIVO
