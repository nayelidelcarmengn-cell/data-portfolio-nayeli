library(readxl)
library(stests)

#Cargar los datos
datos3<- read_xlsx("datos.xlsx", sheet=3)

# Verificación del supuesto de normalidad
qqnorm(datos3$temperatura)
qqline(datos3$temperatura)

# Construimos el intervalo de confianza
ic_var <- var.test(x=datos3$temperatura, conf.level=0.95)$conf.int
ic_var

sqrt(ic_var)
