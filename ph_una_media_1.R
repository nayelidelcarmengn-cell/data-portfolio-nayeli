# Prueba de hipótesis para una media poblacional. I

# Prueba 1 ---- 


# Verificación de los supuestos.
# Varianza es desconocida
# Tamaño de muestra mayor o igual a 40.

# Z


# Planteamiento de hipótesis

# H0: La media de sueldos de los empleados de limpieza es igual a $5000.

# H1: La media de sueldos de los empleados de limpieza es diferente de $5000.

# Nivel de significancia 
#alfa=0.05


# Cálculo del estadístico y del valor p.

library(readxl)
library(BSDA)

datos1<- read_xlsx("datos_ph1media.xlsx", sheet=1) 

z.test( x=datos1$sueldo, sigma.x = sd(datos1$sueldo), mu=5000,conf.level = 0.95,alternative ="two.sided")

#z = -1.0931
# p-value = 0.2743

# Criterio de decisión.

# Si el valor p < alfa se rechaza H0 en favor de Ha.
# Si el valor p > alfa no se rechaza H0.

# Conclusión.
# p-value = 0.2743 > alfa =0.05


# Prueba 2 ---- 

# Verificación de los supuestos.
# Varianza muestral. Varianza poblacional es desconocida.
# Tamaño de muestra mayor o igual que 40.


# Planteamiento de hipótesis

# H0: La media de sueldos de los empleados de limpieza es igual a $5000.

# H1: La media de sueldos de los empleados de limpieza es menor a $ 5000.

# Nivel de significancia alfa=0.05


# Cálculo del estadístico y del valor p.

z.test(x=datos1$sueldo, sigma.x=sd(datos1$sueldo), mu = 5000,conf.level =0.95, alternative = "less" )
#z = -1.0931
# p-value = 0.1372

# Criterio de decisión.

# Si el valor p < alfa se rechaza H0 en favor de Ha.
# Si el valor p > alfa no se rechaza H0.

# Conclusión.
p-value = 0.1372 > alfa=0.05


