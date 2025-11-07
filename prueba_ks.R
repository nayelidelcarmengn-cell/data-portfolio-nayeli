library(readxl)
datosks<-read_xlsx("datos_normalidad.xlsx", sheet=1) 

# Prueba de Kolmogorov-Smirnov 
# Análisis Gráfico----
# Generamos la función de densidad para la muestra de sueldos

sueldos <- datosks$sueldo
fd_sueldos <- density(sueldos)

#Generamos la función de densidad de una v.a. normal con las mismas
#media y varianza que la muestra

va_normal <- rnorm(100, mean(sueldos), sd(sueldos))
fd_normal <- density(va_normal)



# Graficamos la función de densidad de la muestra de sueldos

plot(fd_sueldos)
polygon(fd_sueldos, col="cyan3")


# Sobreponemos  la función de densidad de la muestra de sueldos

lines(fd_normal, col = "red", lwd=4)


# Prueba de normalidad Kolmogorov-Smirnov


#Planteamiento de hipótesis

# H0: La muestra de sueldos proviene de una población normal
# Ha: La muestra de sueldos no proviene de una población normal.

# Nivel de significancia alfa= 0.05

# Cálculo del estadístico y del valor p

ks.test( sueldos, "pnorm", mean(sueldos), sd(sueldos))

#Estadístico:

D = 0.090673

# Valor p=0.4249

# Criterio de decisión
#Si valor-p < nivel de significancia. rechazamos HO en favor de Ha
# Si el valor-p > nivel de significancia, no rechazamos H0.


#Conclusión

Valor p=0.4249 > alfa=0.05


# Los datos no contradicen la normalidad de la variable aleatoria sueldo.

