library(readxl)
library(BSDA)

tutorias<-read_xlsx("datos_calificaciones.xlsx") 

z.test(x=tutorias$si, y=tutorias$no, mu=1.5,
        sigma.x=sd(tutorias$si), 
       sigma.y=sd(tutorias$no),              
       alternative ="greater",
       conf.level=0.95)

#Conclusiones:
#p-value = 0.00536 < 0.05 
# Rechazamos la hipótesis nula en favor de la hipótesis alternativa.
# Inferimos que las diferencia de las calificaciones 
# es mayor que 1.5. O equivalentemente, la calificación
#de los estudiantes de primer año que participaron en el programa obtuvieron una calificación mayor que los que no participaron (Z=2.5514, p-value = 0.005364)
