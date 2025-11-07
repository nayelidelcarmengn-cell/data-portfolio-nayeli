# Cargamos los datos

library(readxl)
peso<-read_xlsx("datos_dieta_mujeres.xlsx",sheet=1)


# Prueba de normalidad Shapiro-Wilk para las diferencias.

# Si el valor p es mayor que 0.05 no se contradice  la normalidad.

# Si el valor p es menor que 0.05 inferimos que no hay normalidad.


diferencias <- peso$antes-peso$despues
shapiro.test(diferencias)
# p-value = 0.7844 > 0.05

# Los datos no contradicen el supuesto de normalidad.


# Procedimiento de prueba de hipótesis

t.test(peso$antes, peso$despues,mu=2,alternative="greater",paired=T, conf.level=0.95)


# Valor p = 0.0248 < alfa=0.05
# Rechazamos H0 en favor de la hipótesis alternativa.
# La hipótesis alternativa indica que la media de las diferencias de los pesos antes y después del tratamiento es mayor que 2.




