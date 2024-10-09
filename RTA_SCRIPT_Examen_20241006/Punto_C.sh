#!/bin/bash

GRUPO_ALUMNO=p1c2_2024_gAlumno
GRUPO_PROFESOR=p1c2_2024_gProfesores
DIR_DESTINO=/Examenes-UTN
i=1

sudo groupadd $GRUPO_PROFESOR

sudo groupadd $GRUPO_ALUMNO


for NRO in {1..3} 
do
	sudo useradd -m -s /bin/bash -G $GRUPO_ALUMNO -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A$NRO

	sudo chown p1c2_2024_A$NRO:p1c2_2024_A$NRO /Examenes-UTN/alumno_$NRO


done

sudo useradd -m -s /bin/bash -G $GRUPO_PROFESOR -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_P1

sudo chown p1c2_2024_P1:p1c2_2024_P1 /Examenes-UTN/profesores

sudo chmod 750 /Examenes-UTN/alumno_1

sudo chmod 760 /Examenes-UTN/alumno_2

sudo chmod 700 /Examenes-UTN/alumno_3

sudo chmod 770 /Examenes-UTN/profesores


for NOMBRE in p1c2_2024_A1 p1c2_2024_A2 p1c2_2024_A3
do
	sudo su -c "whoami > /Examenes-UTN/alumno_$i/validar.txt" $NOMBRE
	i=$((i + 1))
done

sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1





