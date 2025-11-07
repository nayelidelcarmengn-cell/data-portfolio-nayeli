#Nayeli González Novelo

# Cargamos los datos
data("swiss")
#Cargamos las librerías

library(tidyverse)
library(factoextra)
library(ggplot2)

# Transformar las variables

swiss<-scale(swiss, center=T)
swiss <-data.frame(swiss)

#  Explorar los datos

ggplot(swiss, aes(x=Fertility, y= Agriculture))+
  geom_point()
ggplot(swiss, aes(x=Fertility, y= Examination))+
  geom_point()
ggplot(swiss, aes(x=Fertility, y= Education))+
  geom_point()
ggplot(swiss, aes(x=Fertility, y= Infant.Mortality))+geom_point()

ggplot(swiss, aes(x=Agriculture, y= Examination))+
  geom_point()
ggplot(swiss, aes(x=Agriculture, y= Education))+
  geom_point()
ggplot(swiss, aes(x=Agriculture, y= Catholic))+
  geom_point()
ggplot(swiss, aes(x=Agriculture, y= Infant.Mortality))+geom_point()

ggplot(swiss, aes(x=Examination, y= Education))+
  geom_point()
ggplot(swiss, aes(x=Examination, y= Catholic))+
  geom_point()
ggplot(swiss, aes(x=Examination, y= Infant.Mortality))+geom_point()

ggplot(swiss, aes(x=Education, y= Catholic))+
  geom_point()
ggplot(swiss, aes(x=Examination, y= Infant.Mortality))+geom_point()
ggplot(swiss, aes(x=Catholic, y= Infant.Mortality))+geom_point()
set.seed(123)
#library(cluster)
#gap <-clusGap(swiss, FUN=kmeans, K.max=10, B=1000)
#fviz_gap_stat(gap)

# Obtención del número de clústers
fviz_nbclust(swiss, 
               FUNcluster = kmeans,
               method = "gap_stat",
               nstart = 25,
               nboot = 10000)


# La linea punteada marca 1 clúster, pero construir un clúster es equivalente a quedarse con el dataser origninal: sin clasificación.
# Por lo anterior nos inclinamos por ela análisis visualde Catholic-Education y Catholic-Infant.Normality, que sugieren al menos dos clústers.

grupos <- kmeans(swiss, centers=2, nstart =25)

# Interpretación de los centroides por grupo
grupos$centers

# Hay dos clusters:
# El primer clúster se caracteriza por tener la mayor tasa de fertilidad y personas practicando el catolicismo y los valores más bajos de examination.

# El segundo clúster s caracteriza por tener los valore más altos en examination y los valores más bajos en mortalidad y catolicismo.

fviz_cluster(grupos, data=swiss)


