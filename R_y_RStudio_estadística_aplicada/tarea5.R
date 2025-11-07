# Nayeli Gonzalez Novelo

# Reto de la semana del 07 al 12 de diciembre

#Realiza las siguientes actividades. 
#Sube tu tarea en formato .pdf e 
#incluye tu nombre al inicio de las respuesta de tu tarea. 
#Las retroalimentaciones se brindan si se entregó
#la tarea en el tiempo establecido.

library(tidyverse)
library(rstatix)
data("women")
data("ToothGrowth")

# Parte I ----

# Con la base de datos women responde las siguientes preguntas: 

#¿Cuál es la altura máxima y mínima de las mujeres? 
#R= 72 y 58, respectivamente.

women %>% 
  summarise("Altura_maxima"=max(height), "Altura_minima"=min(height))


#¿Cuál es el peso máximo y mínimo de las mujeres americanas?
# R= 164 y 115, respectivamente.

women %>% 
  summarise("Peso_maximo"=max(weight),
            "Peso_minimo"=min(weight))


#¿Cuál es el peso promedio y desviación estándar de las mujeres americanas?
# La media es 137. y la desviacion estandar es 15.5

women %>% get_summary_stats( weight, type="mean_sd")

#Realiza un gráfico de dispersión 

ggplot(women, aes(x=weight, y=height))+
  geom_point( fill="green2", pch=25)+
  labs(x="Peso (lbs)", 
       y="Altura (in)",
       title ="Altura vs peso (mujeres americanas)")+
  theme_minimal()


#y responde ¿Qué relación existe entre el peso y la altura? 
# A mayor peso se tiene mayor altura.


# Parte 2 ----
# Con la base de datos ToothGrowth responde las siguientes preguntas
# Realiza un gráfico de cajas para complementar tu información.
# No es necesario que la variable dosis (dose) la transformes en factor o #categórica, puedes usarla directamente en la función group_by. 

#¿Qué suplemento (supp) produce una mayor longitud en los dientes? 
# Los dientes con longitud maxima se producen con el suplemento VC
# El suplemento OJ produce dientes con mayor longitud media.

#¿Qué suplemento (supp) produce una mayor variación en la longitud de los dientes? 
# Hay mayor variación con el suplemento VC


ToothGrowth %>% 
  group_by(supp) %>% 
  summarise("Longitud_Maxima"=max(len),
            "Longitud_Promedio"=mean(len))

ToothGrowth %>% 
  group_by(supp) %>% 
  summarise("Desviación_estandar"=sd(len))


ggplot(ToothGrowth ,aes( x=supp,y=len) )+
  geom_boxplot(fill=c("yellow","orange") )+
  labs(x="Suplemento",
       y="Longitud",
       title= "Longitud de dientes por suplemento")+
  theme_bw()





#¿Qué dosis (dose) utilizarías para obtener una mayor longitud de los dientes?
# Una dosis de dos miligramos por día.

ToothGrowth %>% 
  group_by(dose) %>% 
  summarise("Longitud_Maxima"=max(len),
            "Longitud_Promedio"=mean(len))


ggplot(ToothGrowth ,aes( x=as.factor(dose),y=len) )+
  geom_boxplot(fill=c("lightblue", "cyan3" ,"blue2") )+
  labs(x="Dosis",
       y="Longitud",
       title= "Longitud de dientes por dosis")+
  theme_bw()


#¿Qué combinación de suplemento y dosis produce dientes más grandes?
# En promedio, los dientes más grandes se producen con 2 ml/dia de cualquier suplemento.
# La máxima longitud de dientes se obtuvo con 2ml/dia de VC

#¿y cuál combinación produce dientes más pequeños??
# En promedio, los dientes más pequeños se producen con 0.5 ml/day de VC.
# La longitud mínima de dientes también se obtuvo con 0.5 ml/day de VC.

ToothGrowth %>%
  group_by(dose,supp)%>% 
  get_summary_stats(len, type="common")


ggplot(ToothGrowth ,aes(y=len,x=supp, fill=supp))+
  geom_boxplot()+
  facet_grid(.~dose)+
    theme_bw()+
  labs(x="Suplemento",
       y="Longitud",
       title= "Longitud de dientes por dosis y suplemento")

    
  

