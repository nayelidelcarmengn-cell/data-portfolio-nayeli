# Nayeli González Novelo
#Reto de la semana del 18 al 24 de enero.

#Realiza las siguientes actividades.
#Sube tu tarea en formato .pdf e incluye tu #nombre al inicio de las respuesta de tu tarea. #Las retroalimentaciones se brindan si se entregó #la tarea en el tiempo establecido.

#Con la base de datos "AutoCollision" de la #librería "insuranceData" determina cómo afecta #el costo estimado de un accidente #automovilístico (Severity) al número de veces en #que el seguro se hace responsable (Claim_Count).

# Cargamos los datos
library(insuranceData)
data("AutoCollision")

m_insurance <- glm(Claim_Count~Severity, family="poisson",AutoCollision)
print(m_insurance)

#Responde lo siguiente:
  
#¿El modelo tiene buen ajuste? 
#Haz la prueba de  sobredispersión y reporta los resultados.
# Prueba de sobredispersion

# H0: El modelo no es sobre disperso, tiene buen ajuste (p>0.05)
# Ha: El modelo es sobredisperso, tiene mal ajuste (p< 0.05)

library(performance)
check_overdispersion(m_insurance)
# Se infiere que el modelo es sobredisperso
# ( chi= 4354.059,p-value =  < 0.001).


#Independientemente si el modelo tiene o no buen #ajuste,

#¿Cómo es el efecto del costo del accidente sobre el número de veces en que el seguro se hizo responsable? Reporta los valores del estimado y el estadístico Z o Chi cuadrado.

# H0: La severidad no tiene efecto  en el número de veces que la aseguradora se hace cargo (p >0.05).
# Ha: La severidad sí tiene un efecto en el número de veces que la aseguradora se hace cargo (p <0.05).

library(jtools)
print(summ(m_insurance, exp=T))
# Si se tratara de un modelo con buen ajuste, inferiríamo que la la severidad sí tiene un efecto en el número de veces que la aseguradora se hace cargo (Z=-32.75, p~ 0.00). El efecto sería negativo. ( tasa de 0.99).

#Realiza el gráfico del modelo.
library(ggplot2)
library(ggeffects)
fit <- ggpredict(model = m_insurance, terms = "Severity")
plot(fit)