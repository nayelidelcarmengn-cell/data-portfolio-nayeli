#Tarea 2. Realiza las siguientes indicaciones en RStudio.
#Entregar la actividad en un archivo .pdf, ya sea compilando en RStudio o copiando el código #
#con sus respuestas.La retroalimentación solo se brindará si entregaste la 
#actividad en el tiempo establecido.

#En este ejercicio utilizas la función concatenar c() para crear 
#los diferentes objetos.

#Actividad 1. Crea cinco objetos que contengan la siguiente información:
  
#  Días: este objeto contiene los siete días de la semana
#("Lunes", "Martes", "Miércoles", etc...)
Dias <- c("Lunes", "Martes","Miercoles", "Jueves", "Viernes","Sabado", "Domingo")
Dias

#Sueño: este objeto contiene el número de minutos que dormiste
#cada día de la semana pasada (420, 400, etc...).
Sueno <- c(420,420,420,420,420,480,480) 
Sueno

#Comida: este objeto contiene el número de comidas que realizaste 
#en cada día de la semana pasada (2, 4, 3, etc...).
Comida <- c(2,2,2,2,2,3,3) 
Comida 

#Ejercicio: este objeto contiene la palabra "Sí", si el día de la semana #anterior hiciste ejercicio, caso contrario codifica como "No"
#(Sí, No, No, etc...).
Ejercicio <- c("No","No","Si","Si","Si","Si","No")
Ejercicio

#Laboral: este objeto contiene la palabra "Trabajo" o "Descanso" 
#si trabajaste o descansaste en cada día de la semana anterior.

Laboral <- c("Trabajo","Trabajo","Trabajo","Trabajo","Descanso","Descanso","Descanso")
Laboral


#Actividad 2. Con los objetos de la actividad 1, crea un data frame que #contenga los objetos en el siguiente orden: Días, Sueño, Comida, Ejercicio y #Trabajo. 
Actividades <- data.frame(Dias, Sueno, Comida, Ejercicio, Laboral)
Actividades 


#Recuerda que el uso de comentarios permite tener una mayor 
#claridad sobre tu código.
