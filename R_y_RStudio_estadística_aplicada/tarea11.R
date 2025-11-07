# Nayeli González Novelo

# Reto de la semana del 01 de febrero al 07 de febrero.
#Sube tu tarea en formato .PDF, incluyendo tu nombre al #inicio de la actividad. 

#Las retroalimentaciones se brindan si se entregó la #tarea en el tiempo establecido.

#La base de datos ToothGrowth, contiene las #variables #len (longitud de los odontoblastos, 
#células que favorecen el crecimiento de los dientes), #supp (método de administración, jugo de naranja o ácido #ascórbico) y dose (tres dosis diferentes de vitamina C, #0.5, 1 y 2 mg/day). 

#Realiza la prueba más adecuada para determinar si #existen diferencias de la longitud de los odontoblastos #(len) en función de la dosis administrada de vitamina C #(dose, es una variable categórica aunque sean de tipo #numérico). Realiza lo siguiente:
  
#Revisa los supuestos y determina el tipo de prueba a #utilizar (ANOVA, ANOVA de Welch o Kruskal Wallis).
#Realiza el gráfico para presentar los resultados.

#Interpreta los resultados añadiendo los estadísticos #asociados a la prueba que utilizaste.

#NOTA: la base de datos ya está cargada en el software R #por lo que puedes acceder directamente a ella sin #instalar alguna otra paquetería, solo usa la función #data("ToothGrowth").

#Realiza los análisis de comparaciones múltiples.

# Librerias
library(tidyverse)
library(rstatix)

# Carga de datos
data("ToothGrowth")

# Validación de supuestos:

# Prueba de normalidad
ToothGrowth %>% 
  group_by(dose) %>% 
  shapiro_test(len)

# Al aplicar la prueba de Shapiro-Wilk, observamos que las submuestras, tomadas por dosis, provienen de poblaciones normales(dosis 0.5 mg:estadístico=0.941, valor-p=0.247; dosis 1 mg: estadístico=0.931, valor p= 0.164;  dosis 2mg: estadístico=0.978, valor p= 0.902)

# Homocedasticidad

ToothGrowth %>% 
  levene_test(len ~ as.factor(dose))

# Por la prueba de Levene, se infiere que las varianzas de las poblaciones de donde fueron tomadas las submuestras son iguales (estadístico=0.646, valor-p=0.528).

modelo <-aov(len~as.factor(dose), ToothGrowth)
summary(modelo)

# A partir de la prueba ANOVA, se infiere que la longitud media depende del factor dosis (estadístico = 67.42 , valor-p=9.53e-16).

# Aplicamos la prueba de Tukey para idenficar qué dosis presentan diferencias:

tukey_hsd(modelo)
# De acuero con la prueba de Tukey hay diferencias entre todas las muestras:

# La diferecia entre las medias de las longitudes de las dosis de 0.5mg y 1mg se estima en 9.13 (2e-8).

# La diferencia entre las medias de las dosis de 0.5 mg y 2 mg se estima en 15.49 (p.adj 1.12 e-11).

# La diferencia entre las medias de las  dosis de 1mg y 2 mg se estima  en 6.36 (4.25 e-5).

plot(TukeyHSD(modelo))

# Los resultados de la prueba ANOVA se pueden visualizar.

library(ggstatsplot)
ggbetweenstats(data = ToothGrowth, x= dose, y=len, type= "parametric", var.equal = T)



