library(readxl)
datossw<-read_xlsx("datos_normalidad.xlsx", sheet=2) 

# Prueba de Shapiro-Wilk para normalidad

# Análisis Gráfico----


# Generamos la función de densidad para la muestra de ingresos familiares.

ingresos<-datossw$ingreso
fd_ingresos <- density(ingresos)

#Generamos la función de densidad de una v.a. normal con las mismas
#media y varianza que la muestra de ingresos familiares.

norm <- rnorm(100, mean(ingresos), sd(ingresos))
fd_normal <-density(norm)

# Graficamos la función de densidad de la muestra de ingresos familiares.
plot(fd_ingresos)
polygon(fd_ingresos, col="orange3")

# Sobreponemos  la función de densidad de la variable aleatoria normal.

lines(fd_normal, col="blue", lwd=4)



library(readxl)
datossw<-read_xlsx("datos_normalidad.xlsx", sheet=2) 



# Prueba de normalidad de Shapiro-Wilk

# Planteamiento de hipótesis

# H0: La muestra de ingresos familiares proviene de una población normal
# Ha: La muestra de ingresos familiares no proviene de una población normal.

# Nivel de significancia alfa= 0.05

# Cálculo del estadístico y del valor p

shapiro.test(datossw$ingreso)



#Estadístico:
W = 0.9738

# Valor p=0.6475


# Criterio de decisión

#Si valor-p < nivel de significancia.Rechazamos HO en favor de Ha.

# Si el valor-p > nivel de significancia, no rechazamos H0.


Valor p=0.6475> alfa=0.05


#Conclusión

# Los datos no contradicen la normalidad de la variable aleatoria ingresos familiares.
