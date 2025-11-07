# Nayeli González Novelo

# Realiza las siguientes actividades en RStudio
# Entregar la actividad en un archivo .pdf ya  
# sea  compilando RStudio o copiando el código con sus respuestas.

#La retroalimentación solo se brindará
#si entregaste la actividad en el tiempo establecido. 

#Utilizando la base de datos “decathlon” disponible en la # librería FactoMineR, realiza un análisis de componentes principales:

library(FactoMineR)
data(decathlon) 
library(dplyr)
datos<- decathlon %>% 
  select(-Competition)

# Comenzamos realizando la prueba de Barlett para determinar si la matriz de datos es correlacionable.
# Prueba de Barlett
# H0= La matriz de datos no es correlacionable.
# Ha= La matríz de datos sí es correlacionable.

library(psych)
cortest.bartlett(datos)

# De acuerdo con la prueba de Barlett, la matriz de datos # sí es correlacionable (Estadístico = 511.0144, df=66, valor-p =5.11907e-70 <0.05)

#1) Determina el número de componentes principales a considerar.

datos_est <-data.frame(scale(datos,center=T))
modelo <-PCA(datos, scale.unit = T, graph = F)

# Aplicamos el criterio de la varianza acumulada para determinar el número de componentes principales a considerar. Tomaremos las componentes que acumulen al menos el 80% de variación explicada.

modelo$eig
# Como vemos en la lista anterior, requerimos de al menos 5 componentes.
library(factoextra)
fviz_screeplot(modelo)

#2) Incluye en tu reporte al menos un gráfico biplot e interpretalo.
fviz_pca_biplot(modelo, axes = c(1,2))
modelo$var$coord

# La primera componente está relacionada principalmente con las competencias de salto, los puntos y  el ranking.
# La segunda componente está relacionada principalmente con el lanzamiento de peso y disco.
# En el biplot los vectores en azul representan a las variables como combinación lineal de las dimensiones 1 y 2. Mientras más grande es su proyección sobre el eje x más contribuyen a  la dimensión 1 y mientras más grande es su proyección con respecto al eje y, más contribuyen con la dimensión 2.

# Por otra parte, los atletas que están cerca de los vectores que  representan a las competiciones obtienen valores más altos en dichas competiciones.

# Por ejemplo, Warners tiene un puntaje elevado # en Long jump.

# karpov tuvo mayor puntaje en general.
