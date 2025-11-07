#Semana del 23 al 28 de noviembre del 2024.

#Tarea 3. Con la base de datos Escuela_tarea.xlsx 
#(enlace de descarga: https://we.tl/t-xTj9ahRHeP) 
#responde las siguientes preguntas, 
#añadiendo en la respuesta el código que utilizaste.

#En RStudio Importa la base de datos y asígnale el nombre Escuela.
#Entregar la actividad en un archivo .pdf, ya sea compilando en RStudio o #copiando el código en un archivo .doc. La retroalimentación solo se brindará #si entregaste la actividad en el tiempo establecido.

library(dplyr)
library(readxl)

Escuela<-read_excel("Escuela_tarea.xlsx")
names(Escuela)
head(Escuela)

#1. ¿Qué variables se seleccionan si utilizas el siguiente código:
#Escuela %>% select(1, 3, 4, 6)?

#R= "ID"       "Apellido" "Genero"   "Grado" 

names(Escuela %>% select(1, 3, 4, 6))


#2. ¿Qué variable desaparece de la base si utilizas el siguiente código: #Escuela %>% select(-5)?

#R= Edad

names(Escuela %>% select(-5))


#3. ¿Cuántos hombres hay en la base de datos?

#R=519

nrow(Escuela %>% filter(Genero == "Hombre"))


#4. ¿Cuántas mujeres hay en la base de datos?

#R=481

nrow(Escuela %>% filter(Genero == "Mujer"))


#5. ¿Cuántos estudiantes pertenecen al grupo A?

#R=96

nrow(Escuela %>% filter(Grupo == "A"))


#6. ¿Cuántos estudiantes tienen una edad de 18 años?

#R= 281

nrow(Escuela %>% filter(Edad ==18))


#7. ¿Cuántos estudiantes hombres tiene más de 16 años que pertenecen
#al grupo B y que obtuvieron una calificación mayor a 8?

#R= 5

nrow(Escuela %>% 
  filter(Genero == "Hombre" & Edad > 16 & Grupo =="B" & Calificacion > 8))


#8. ¿Cuánto estudiantes mujeres pertenecen al grado 3 y al grupo L?

#R=16

nrow(Escuela %>% 
  filter(Genero == "Mujer" & Grado ==3 & Grupo =="L"))
