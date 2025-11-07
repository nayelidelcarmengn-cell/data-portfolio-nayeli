# Cargamos los datos
library(readxl)
datosks<-read_xlsx("datos_normalidad.xlsx", sheet=1) 


# Prueba de Kolmogorov-Smirnov ----



# Análisis Gráfico 



# Generamos la función de densidad para la muestra de sueldos
sueldos <- datosks$sueldo
fd_sueldos<- density(sueldos)

# Generamos la función de densidad de una v.a. normal con la misma
#media y varianza que la muestra de sueldos.

va_normal<-rnorm(100, mean(sueldos), sd(sueldos) )
fd_normal<- density(va_normal)

# Graficamos la función de densidad de la muestra de sueldos
plot(fd_sueldos)
polygon(fd_sueldos, col = "cyan3")

# Graficamos la función de densidad de la muestra
lines(fd_sueldos, col="red", lwd=4)

# Prueba de normalidad de Kolmogorov-Smirnov

# Planteamiento de hipótesis

# H0: La muestra de sueldos proviene de una población normal
# Ha: La muestra de sueldos no proviene de una población normal.

# Nivel de significancia alfa= 0.05

# Cálculo del estadístico y del valor p

ks.test(sueldos,"pnorm",mean(sueldos),sd(sueldos))

#Estadístico:

#D=0.09.673

# Valor P = 0.4249

# Criterio de decisión
#Si valor-p < nivel de significancia. rechazamos HO en favor de Ha
# Si el valor-p > nivel de significancia, no rechazamos H0.


#Conclusión
# En este caso valor p= 0.4249 > alfa = 0.05
# No rechazamos H0.

# Los datos no contradicen la normalidad de la variable sueldo.


# Prueba de Shapiro-Wilk

# Cargamos los datos
library(readxl)
datossw<-read_xlsx("datos_normalidad.xlsx", sheet=2) 

# Generamos la función de densidad para la muestra
ingresos <- datossw$ingreso
fd_ingresos<- density(ingresos)
# Generamos la función de densidad de una v.a. normal
normal<-rnorm(100, mean(ingresos), sd(ingresos) )
fd_normal<- density(normal)

# Graficamos la función de densidad de la muestra
plot(fd_ingresos)
polygon(fd_ingresos, col = "orange3")

# Graficamos la función de densidad de la muestra
lines(fd_normal, col="blue", lwd=4)

# Prueba de normalidad

# Planteamiento de hipótesis

# H0: La muestra ingresos familiares proviene de una población normal
# Ha: La muestra de ingresos no proviene de una población normal.

# Nivel de significancia alfa= 0.05

# Cálculo del estadístico y del valor p

shapiro.test(ingresos)

#Estadístico:
#W=0.9738

# Valor P = 0.6475

# Criterio de decisión
#Si valor-p < nivel de significancia. rechazamos HO en favor de Ha
# Si el valor-p > nivel de significancia, no rechazamos H0.


# Conclusión
# En este caso valor p= 0.6475 > alfa = 0.05
# No rechazamos H0.

# Los datos no contradicen la normalidad de la variable ingreso familiar.

