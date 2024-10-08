#!/bin/bash

GRUPO_ALUMNO=p1c2_2024_gAlumno
GRUPO_PROFESOR=p1c2_2024_gProfesores

sudo groupadd $GRUPO_PROFESOR

sudo groupadd $GRUPO_ALUMNO


for NRO in {1..3} 
do
	sudo useradd -m -s /bin/bash -G $GRUPO_ALUMNO -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A$NRO

	sudo chown p1c2_2024_A$NRO:p1c2_2024_A$NRO /Examenes-UTN/alumno_$NRO


done

sudo useradd -m -s /bin/bash -G $GRUPO_PROFESOR -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_P1

sudo chown p1c2_2024_P1:p1c2_2024_P1 /Examenes-UTN/profesores



