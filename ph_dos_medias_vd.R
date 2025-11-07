# Cargamos los datos
library(readxl)
tiempo <- read_xlsx("datos_taller.xlsx", sheet=1)
pluma <- tiempo$pluma
cadeneta <- tiempo$cadeneta

# Prueba de normalidad Shapiro-Wilk.

# Si el valor p es mayor que 0.05 no hay evidencia significativa en contra de la normalidad.

# Si el valor p es menor que 0.05 inferimos que no hay normalidad.

# Muestra 1
shapiro.test(pluma)
# p-value = 0.8652 > 0.05
# Los datos no contradicen el supuesto de normalidad.

# Muestra 2
shapiro.test(cadeneta)

# p-value = 0.801 > 0.05
# No hay evidencia suficiente en contra de la  normalidad.



# Prueba de igualdad de varianzas 

# En el contexto del problema planteado.

# H0: La varianza del tiempo de bordado con punto de pluma es igual a la varianza del tiempo de bordado de cadeneta. 

# Ha: La varianza del tiempo de bordado con punto de pluma es distinto a la varianza tiempo de bordado de cadeneta.

# Valor de significancia 0.05

# Calculo del valor p y del estadístico 

var.test(pluma,cadeneta)
# p-value = 5.291e-11 = 0.0000000000529 <.05

# Criterio de decisión: 

# Si el valor p es mayor que 0.05 no hay evidencia suficiente en contra de la igualdad de varianzas.

# Si el valor p es menor que 0.05 inferimos que las varianzas son distintas.


# Se infiere que las varianzas son distintas.

# Prueba t para la diferencia de medias.

t.test(pluma,cadeneta, mu=0, alternative ="less", var.equal=F)

# 9.054e-05 =0.00009054 < 0.05

# Rechazar H0 en favor de Ha

# Inferimos que la media poblacional del tiempo de bordado con puntada de pluma es menor que la media del tiempo de bordado con puntada de cadeneta con un nivel de significancia de 0.05.
