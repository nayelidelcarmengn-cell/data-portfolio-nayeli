#install.packages(datasets)

# Prueba de Shapiro-Wilk----

# Orange es una base de datos que registró la circunferencia de las naranjas cosechadas de 35 árboles seleccionados aleatoriamente y la edad de dichos árboles.

data("Orange")
head(Orange)

circunferencia<-Orange$circumference #circunferencia de las naranjas cosechadas en mm.
  
# Prueba la normalidad

# La muestra de las circunferencias de las naranjas proviene de una población normal.

# La muestra de las circunferencias de las naranjas NO proviene de una población normal. 

# Nivel de significancia: 0.05

# Cálculo del estadístico y del valor p:
shapiro.test(circunferencia)

#W = 0.94591, p-value = 0.08483

# Criterio de decisión:
# No rechazamos H0 si valor p> 0.05
# Rechazamos H0 en favor de Ha si valor p <0.05

# Inferencia
#p-value = 0.08483 >0.05 por lo que no se contradice 
#la normalidad de los datos.


# Prueba de Kolmogorov-Smirnov-lilliefors ----
# install.packages ("nortest")
library(nortest)
data(WWWusage)
head(WWWusage)
# WWWusage regitró el número de personas conectadas a un servidor cada  minuto. Cuenta con 100 observaciones.

conexiones<-WWWusage 

# Prueba la normalidad

# La muestra de personas conectadas durante un minuto proviene de una población normal.

# La muestra de ersonas conectadas durante un minuto NO proviene de una población normal. 

# Nivel de significancia: 0.05

# Cálculo del estadístico y del valor p:
lillie.test(conexiones)

#D = 0.10588, p-value = 0.00765 <0.05 

# Criterio de decisión:
# No rechazamos H0 si valor p> 0.05
# Rechazamos H0 en favor de Ha si valor p <0.05

# Inferencia
#p-value = p-value = 0.00765> 0.05 por lo que los datos no provienen de una población con distribución normal.

