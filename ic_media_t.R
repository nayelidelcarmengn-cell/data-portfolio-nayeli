library(readxl)
#Cargar los datos

datos1<-read_xlsx("datos.xlsx", sheet=1)

# Verificar la normalidad 

qqnorm(datos1$ingreso)
qqline(datos1$ingreso)

# Construir el intervalo de confianza

t.test(x=datos1$ingreso, conf.level=0.95)$conf.int
