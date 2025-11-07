# Comparación de dos medias poblacionales.

# Comenzamos registrando los datos:
library(readxl)
peso<-read_xlsx("datos_huitlacoche.xlsx", sheet=1)

# Verificación de supuestos.
# Supuesto de normalidad

# Prueba de Shapiro-Wilk para la muestra 1 (menos de 50 datos):

#H0: La muestra proviene de una población normal.
#H1: La muestra no proviene de una población normal.

# Nivel de significancia 0.05
# Calculo del estadístico y valor p.

shapiro.test(peso$texcoco)
# W = 0.95554
# Criterio de decisión:
# p-value = 0.6155

# Criterio de decisión
# Rechazamos H0 en favor de Ha si el valor p es menor que el nivel de significancia.

# No rechazamos H0 si el valor p es mayor que el nivel de significancia.
# p-value = 0.6155 > 0.05

# Los datos no contradicen la normalidad.


# Prueba de Shapiro-Wilk para la segunda muestra (menos de 50 datos):

#H0: La muestra proviene de una población normal.
#Ha: La muestra no proviene de una población normal.

# Nivel de significancia 0.05

# Calculo del estadístico y valor p.

shapiro.test(peso$celaya)

#W = 0.93181, p-value = 0.2903

# Criterio de decisión:
# Rechazamos H0 en favor de Ha si el valor p es menor que el nivel de significancia.


# No rechazamos H0 si el p-valor es mayor que el nivel de significancia.
# p-value = 0.2903 > alfa=0.05


# Los datos no contradicen la normalidad.

# Realizamos la prueba de hipótesis para la igualdad de varianzas.

#H0: Las varianzas son iguales.
#Ha: Las varianzas no son iguales.

# Nivel de significancia 0.05

# Calculo del estadístico y del valor p.

var.test(x=peso$texcoco,y=peso$celaya,alternative = "two.sided", conf.level =0.95)
#F = 0.34057
# p-value = 0.05294
# Criterio de decisión:

# Rechazamos H0 en favor de Ha si el valor p es menor que el nivel de significancia.

# No rechazamos H0 si el p-valor es mayor que el nivel de significancia.

# p-value = > alfa =0.05
# Los datos no contradicen la igualdad de varianzas.


# Cálculo del estadístico y del valor p en la prueba t.


t.test(x=peso$texcoco,y=peso$celaya, var.equal=T,alternative = "two.sided", conf.level = 0.95)

