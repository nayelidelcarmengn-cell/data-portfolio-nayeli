library(readxl)
library(rstatix)

tiempos<-read_xlsx("renovacion_licencia.xlsx")
# mediana del grupo 1 (mujeres) 
# es mayor que 
# mediana del grupo 2 (hombres).

wilcox_test(tiempos,minutos~grupo,
            alternative="greater",
            exact=T)
# estadístico = 92 
# Valor p = 0.471

# Criterio de decisión
#Valor p < alfa=0.05 rechazamos H0 en favor de Ha
#Valor p > alfa=0.05 no rechazamos H0

#Valor p = 0.471 > 0.05
#Inferencia No rechazamos H0.
# No hay evidencia de que la mediana del tiempo que 
#le toma contestar a las mujeres sea mayor
#que la de los hombres.