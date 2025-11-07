library(readxl)

#Validación del supuesto de simetría

iqs<-read_xlsx("iq_parejas.xlsx",sheet=2)
esposa<-iqs$iq[ iqs$grupo == "esposa" ] 
esposo<-iqs$iq[ iqs$grupo == "esposo" ] 

diferencias<-esposa-esposo

boxplot(diferencias, 
        col="yellow",
        main="Validación de la simetría",
        ylab="diferencias")

#install.packages("rstatix")
library(rstatix)

# mediana del grupo 1 (esposas) 
# es menor que 
#mediana del grupo 2 (esposos).

iqs %>% 
  wilcox_test(iq~grupo,
              paired=T, 
              alternative="less", 
              exact=T)

# estadístico = 94.5 
# Valor p = 0.5


# Criterio de decisión
#Valor p < alfa=0.05 rechazamos H0 en favor de Ha
#Valor p > alfa=0.05 no rechazamos H0

#Valor p = 0.5 > 0.05
#Inferencia No rechazamos H0.
# No hay evidencia de que la mediana del IQ de las mujeres sea menor que la de los hombres.