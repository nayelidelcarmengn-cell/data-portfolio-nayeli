# Nayeli Gonzalez Novelo 
# Reto de la semana del 14 al 20 de diciembre

#Realiza las siguientes actividades. Sube tu tarea en formato .pdf
#e incluye tu nombre al inicio de las respuesta de tu tarea. Las 
#retroalimentaciones se brindan si se entregó la tarea en el tiempo establecido.

library(ggplot2)
library(dplyr)
library(rstatix)
# Cargamos los datos
data("swiss")

#Con la base de datos swiss, realiza una prueba de correlación entre la
#variable agricultura (Agriculture) y la variable Evaluación (Examination).
#Realiza la prueba de normalidad y determina cuál es la prueba de correlación
#a utilizar. Reporta tus resultados incluyendo el valor de correlación 
# con su respectiva letra y el valor de p. Incluye un gráfico de dispersión.



# Analizamos gráficamente si existe correlación entre las variables.


ggplot(swiss, aes(x=Agriculture, y= Examination))+
  geom_point(col="purple",fill="green",pch=23 )+
  labs(title = "Examination vs Agriculture")+
  theme_gray( )

# El diagarama de dispersión sugiere correlación negativa.

# Realizamos las pruebas de normalidad:

swiss %>% 
  shapiro_test(Agriculture, Examination)

# Ambas muestras provienen de una población normal por lo que calculamos
# la correlación de Pearson:

swiss %>%
  cor_test(Agriculture, Examination, method = "pearson")

# Se infiere que las variables "Agriculture" y "Examination" sí están
# correlacionadas de forma negativa. 
# El valor de correlación de Pearson es -0.69-

#Con la misma base de datos swiss, realiza una prueba de correlación entre 
#la variable Católicismo (Catholic) y la variable Fertilidad (Fertility). 
#Realiza la prueba de normalidad y determina cuál es la prueba de correlación 
#a utilizar. Reporta tus resultados incluyendo el valor de correlación con su
#respectiva letra y el valor de p. Incluye un gráfico de dispersión.


# Realizamos un análisis gráfico preliminar de la correlación a través del
# gráfico de dispersión.

ggplot(swiss, aes(x=Catholic, y=Fertility))+
  geom_point(col="orange", fill="cyan", pch=23)+
  labs(Title="Fertilidad vs Catolicismo",
       x="Catolico", y="Fertilidad")+
  theme_grey()
# El gráfico no sugiere correlación entre las variables.

# Realizamos las pruebas de normalidad para las variables de interés.

swiss %>% 
  shapiro_test(Catholic, Fertility)

# Se observa que la variable "Catholic" no cumple con el supuesto 
# de normalidad. Ya que  se cuentan con mas de 30 bservaciones
#(y de acuerdo con la información brindada en las infografías en plataforma),
# usaremos la prueba de Kendall.

swiss %>% 
  cor_test(Catholic,Fertility, method = "spearman")

# El valor p es menor que 0.05, por lo que se confirma lo observado en
# el diagrama de dispersión: no hay evidencia de correlación entre las
# variables.

# El diagarama de dispersión sugiere correlación negativa.# El diagrama de dispersión sugiere correlación negativa.
# El valor de correlación de Spearman es rho= 0.41