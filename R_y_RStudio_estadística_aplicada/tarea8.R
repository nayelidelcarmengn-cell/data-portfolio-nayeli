# Nayeli González Novelo
#Reto de la semana del 11 al 17 de enero.

#Realiza las siguientes actividades.Sube tu tarea en formato #.pdf e incluye tu nombre al inicio de las respuesta de tu  #tarea. Las retroalimentaciones se brindan si se entregó la #tarea en el tiempo establecido.

#Con la base de datos faithful disponible en R, realiza un #análisis de regresión lineal simple. 

#El objetivo es #determinar cómo afecta el tiempo de espera 
# entre erupciones (waiting) al tiempo que dura cada erupción (eruptions). 

#Determina lo siguiente:

#Si el modelo cumple con los supuestos de normalidad, #homocedasticidad e independencia (realiza cada prueba, #reporta el estadístico y su valor de p).

#Determina si la variable tiempo de espera entre erupciones #tiene un efecto sobre el tiempo de la erupción y cómo es el #efecto (reporta el estadístico y su valor de p).
#Reporta el coeficiente de determinación en porcentaje.

# Cargar  datos,
str(faithful)  
erupciones<-faithful$eruptions
tiempo_espera <-faithful$waiting

# Realizamos un análisis exploratorio para saber si las variables se encuentran correlacionadas.

# Gráfico de dispersión
library(ggplot2)
ggplot( faithful,aes(waiting,eruptions))+
  geom_point()+
  labs(title="Erupciones vs tiempo de espera",
         x="Tiempo de espera entre erupciones",
         y="Número de erupciones")+
  theme_update()

# En este caso, la gráfica sugiere una correlación positiva. # entre el tiempo de espera entre erupciones y el 
# número de erupciones.

# Formalizamos lo anterior mediante una prueba de hipótesis.

ks.test(erupciones,"pnorm", mean=mean(erupciones), sd=sd(erupciones))
ks.test(tiempo_espera,"pnorm",mean=mean(tiempo_espera),sd=sd(tiempo_espera))
cor.test(erupciones,tiempo_espera, method = "spearman")
# Se infiere de la prueba de correlación de Spearman que 
# hay correlación entre las variables.

# Cálculo de los coeficientes de regresión
modelo<-lm(erupciones~tiempo_espera)
summary(modelo)

# Observamos que el modelo es significativo:
# F=1162, valor p <2.2e-16.

# El modelo explica el 81.15 % de la variación del número 
# de erupciones:
# R2=0.8115.
# Por cada unidad de tiempo que incrementa el tiempo de espera entre erupciones el valor esperado de las erupciones es 0.07_
# t=34.09, p< <2e-16 


# Análisis de los residuales.
# Normalidad. Prueba de Kolmogorov-Smirnov
ks.test(modelo$residuals,"pnorm",mean=0, sd=sd(modelo$residuals))
# Se infiere que los residuales poseen una distribución normal con media 0:
# D = 0.047405, p valor = 0.574

# Homocedasticidad: Prueba de Breusch-Pagan
library(lmtest)
bptest(modelo)
# Se infiere que los residuales son homocedásticos.
# BP = 1.5531,p-value = 0.2127

# Autocorrelación. Prueba de Durbin-Watson
# Mientras mas alejado de 2 está el estadístico hay más posibilidad de de autocorrelación.
dwtest(modelo)
# Se infiere que los residuales no están autocorrelacionados
# BP = 1.5531, valor p = 0.2127

# Reporte generado mediante la librería report.
library(report)
report(modelo)
