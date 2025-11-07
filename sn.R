# Prueba de hipótesis para una media poblacional II.

# Prueba 1 ---- 
# Nos interesa probar que la media poblacional de los precios fijados por los artesanos es distinta de $500.


# Verificación de los supuestos.
# Varianza es desconocida
# Normalidad
library(readxl)
datos2<- read_xlsx("datos_ph1media.xlsx", sheet=2) 
shapiro.test(datos2$precio)

# El valor p es mayor que el nivel de significancia alfa=0.05.
# No se rechaza H0.
# No hay evidencia para negar la normalidad de los datos.

# Aplicar la prueba t.

# Planteamiento de hipótesis

# H0: La media de precio del bolso de palma fijado por los artesanos es igual a $500.
# Ha: La media de precio del bolso de palma fijado por los artesanos es distinto de $500.

# Nivel de significancia 
#alfa=0.05


# Cálculo del estadístico y del valor p.
t.test(datos2$precio,mu=500, alternative ="two.sided", conf.level = 0.95 )

# t = 0.58579, df = 19
#p-value = 0.5649



# Criterio de decisión.

# Si el valor p < alfa se rechaza H0 en favor de Ha.
# Si el valor p > alfa no se rechaza H0.

# Conclusión.
# p-value = 0.5649 > alfa=0.05

# Los datos no contradicen que la media de precios fijada por los artesanos para el bolso de palma sea de $500

# Prueba 2 ---- 
# Queremos saber si la media del precio del bolso de palma fijado por los artesanos es mayor que $500.

# Verificación de los supuestos.
# Varianza poblacional desconocida.
# Normalidad

# Aplicamos la prueba de hipótesis T.

# Planteamiento de hipótesis

# H0: La media de precio del bolso de palma fijado por los artesanos es igual a $500.
# Ha: La media de precio del bolso de palma fijado por los artesanos es mayor  que $500.

# Nivel de significancia alfa=0.05


# Cálculo del estadístico y del valor p.

t.test(datos2$precio, mu=500, alternative = "greater", conf.level=0.95 )
# t = 0.58579, df = 19,
# p-value = 0.2825

# Criterio de decisión.

# Si el valor p < alfa se rechaza H0 en favor de Ha.
# Si el valor p > alfa no se rechaza H0.

# Conclusión.
# p-value = 0.2825 > alfa =0.05.
# No hay evidencia suficiente para suponer que la media sea distinta a $500.


