#!/bin/bash

sudo fdisk /dev/sdc << EOF
n
e



w
EOF


PARTICION_NRO=5

for ALUMNO in {1..3}
do
        for PARCIAL in {1..3}
        do
                if [ $PARTICION_NRO -ge 5 ] && [ $PARTICION_NRO -le 13 ]; then
                        sudo fdisk /dev/sdc << EOF
                        n

                        +1G
                        w
EOF
                        sudo mkfs.ext4 /dev/sdc$PARTICION_NRO

                        RUTA_MONTURA="/Examenes-UTN/alumno_$ALUMNO/parcial_$PARCIAL"

                        echo "/dev/sdc$PARTICION_NRO  $RUTA_MONTURA     ext4  defaults  0 0"  | sudo tee -a /etc/fstab

                        sudo mount -a

                fi
                PARTICION_NRO=$((PARTICION_NRO + 1))
        done
done

if [ $PARTICION_NRO -eq 14 ]; then
        sudo fdisk /dev/sdc << EOF
        n

        +1G
        w
EOF
        sudo mkfs.ext4 /dev/sdc$PARTICION_NRO

        RUTA_MONTURA="/Examenes-UTN/profesores/"

        echo "/dev/sdc$PARTICION_NRO  $RUTA_MONTURA  ext4  defaults  0 0" | sudo tee -a /etc/fstab

        sudo mount -a
fi
