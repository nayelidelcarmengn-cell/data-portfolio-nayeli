# Nombre: Nayeli del Carmen González Novelo

#Realiza las siguientes actividades. Sube tu tarea en formato .pdf e incluye tu 
#nombre al inicio de las respuesta de tu tarea. Las retroalimentaciones 
#se brindan si se entregó la tarea en el tiempo establecido.

# Recuerda que las bases de datos ya están en R, solo usa la función data
#para importarlas, por ejemplo data("quakes").

library(ggplot2)
library(ggthemes)

# Grafica de dispersion ----

# Con la base de datos trees crea un gráfico de dispersión entre la variable Volume
#(voumen del árbol) y Girth (diámetro del árbol). 

data("trees")

ggplot(trees, aes(x=Girth,y=Volume))+
  geom_point(color="purple4", fill="green3",size=3, shape=21)+
  labs(x="diámetro", 
       y="volumen",
       title = "Volumen de un árbol por diámetro")+
  theme_pander()


# Describe la relación existente entre ambas variables. 
# R= Existe una correlación positiva entre las variables; es decir, 
# a mayor diámetro se espera mayor volumen.


# Grafica de caja ----

#Con la base de datos PlantGrowth crea un gráfico de cajas y contesta las 
#siguientes preguntas: 

data(PlantGrowth)

ggplot(PlantGrowth, aes(group,weight, fill=group))+
  geom_boxplot()+
  labs(x="Grupos",
        y="Peso",
        title = " Peso de plantas por tratamiento")+
  theme_gdocs()



#¿Cuál de los tres grupos produce un mayor rendimiento? 
# R= El grupo que recibe el tratamiento 2 : "trt2"



#¿Cuál produce un menor rendimiento? 
# R= El grupo que recibe el tratamiento 1: "trt1".


# Grafica de densidad----
#Con la base de datos quakes  crea un gráfico de densidad y un histograma. 


data(quakes)

ggplot(quakes, aes(mag))+
  geom_density( color="blue4",alpha=0.5, fill="orange3", lwd=2)+
  labs(x="Magnitud del temblor",
       y="Probabilidad",
       title="Probabilidad de que ocurra un temblor de cierta magnitud")+
  theme_solarized_2()
  

#Responde lo siguiente 

#¿En qué magnitud se han presentado la mayoría de los temblores (mag)? 
# R= En una magnitud de aproximadamente 4.5


# Histograma ----
# y un histograma.
ggplot(quakes, aes(depth))+
  geom_histogram(color="pink3", fill="cyan3",binwidth = 50)+
  labs(x="Profundidad", 
       y="Número de temblores",
       title="Temblores por profundidad")+
  theme_wsj()

#¿A qué profundidad se han producido la mayoría de los temblores (depth)?
#La mayoría de los templores se han producido a una profundidad menor de 
# 50  unidades.

  
  
