# Nayeli González Novelo

#Reto de la semana del 25 al 31 de enero.

#Sube tu tarea en formato .PDF, incluyendo tu nombre # al inicio de la actividad.

# Las retro-alimentaciones se brindan si se entregó la tarea en el tiempo establecido.

# Con la base de datos "genderweight" de la librería # "datarium" determina si el peso (weight) de los 
# hombres y #mujeres  (group) es igual o diferente. 

# Todas las observaciones son independientes. Realiza lo siguiente:
  
#Identifica la prueba que vas a utilizar tomando en #consideración si se cumplen los supuestos 
#estadísticos de la prueba que seleccionaste.
#Reporta los resultados y tus conclusiones.
#Realiza el gráfico de la prueba.

library(datarium)
data(genderweight)
str(genderweight)

library(ggplot2)
library(rstatix)
ggplot(genderweight, aes(x=weight))+
  geom_boxplot()+
  facet_wrap(~group)

genderweight %>%
  group_by(group) %>% 
  shapiro_test(weight)

genderweight %>% 
  levene_test(weight~group)

genderweight %>% 
  t_test(weight ~ group, var.equal = F)

library(ggstatsplot)
ggbetweenstats(genderweight , x="group", y="weight", type="parametric", var.equal=F)
