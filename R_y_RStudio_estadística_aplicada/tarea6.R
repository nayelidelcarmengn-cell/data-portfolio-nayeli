#Nayeli Gonzalez Novelo

#Reto de la semana del 14 al 20 de diciembre

#Realiza las siguientes actividades. Sube tu tarea en formato .pdf
#e incluye tu nombre al inicio de las respuesta de tu tarea.
#Las retroalimentaciones se brindan si se entregó la tarea en el tiempo establecido.
library(tidyverse)
library(nortest)
data(trees)
data(swiss)

#Ejercicio 1 ----
#1. Con la base de datos trees realiza un gráfico de densidad
#de la variable Heigth y realiza lo siguiente:
  
# a) ¿Cómo es la distribución de los datos, cumple con la forma 
#de campana de Gauss?
# R:La gráfica sugiere una distribución aproximadamente normal: 
#la curva es casi simétrica y mesocúrtica.


ggplot(trees, aes(x=Height))+
  geom_density( fill="lightgreen")+
  labs(title="Altura de lo árboles",
       x="Altura",
       y="Densidad")+
  theme_grey()



#b) Realiza una prueba de normalidad a la variable Height e 
#indica si se cumplió el supuesto de normalidad y discute si 
#lo que observaste en el inciso a coincide con los resultados 
#de la prueba. Utiliza cualquier prueba. No olvides reportar
#el estadístico y su valor de p asociado.

#R: H0: La muestra observada proviene de una población con distribucion normal.
# Ha: La muestra observada no proviene de una poblacion con distribucion normal.
# Nivel de significancia: alfa =0.05
# Estadistico: W = 0.96545,
# Valor p:  0.4034
# Inferencia: La muestra NO proporciona evidencia para rechazar la normalidad.

shapiro.test(trees$Height)

# Ejercicio 2
#3. Con la base de datos swiss realiza un gráfico de densidad
#de la variable Education y realiza lo siguiente:
  
# a) ¿Consideras que la distribución de los datos cumple con 
#una distribución normal o campana de Gauss?
# R: No, presenta una cola que sugiere asimetría derecha.
ggplot(swiss, aes(x= Education))+
  geom_density(fill="lightgreen")+
  labs(title="Educación más allá de la escuela primaria para reclutas",
       x="Educacion",
       y="Desidad")+
  theme_grey()
  
# b) Realiza una prueba de normalidad a la variable Education 
#y verifica si se cumple el supuesto de normalidad. No olvides
#reportar el estadístico y su valor de p asociado.

#R: H0: La muestra observada proviene de una población con distribucion normal.
# Ha: La muestra observada no proviene de una poblacion con distribucion normal.
# Nivel de significancia: alfa =0.05
# Estadistico: W = 0.7482, 
# Valor p:  1.312e-07
# Inferencia: La muestra proporciona evidencia para rechazar la normalidad.
shapiro.test(swiss$Education)
