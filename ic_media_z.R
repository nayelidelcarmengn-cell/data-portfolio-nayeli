library(readxl)
library(BSDA)

# Cargamos los datos

datos2 <- read_xlsx("datos.xlsx", sheet=2)

# Construcción del intervalo de confianza

dsm <- sd(datos2$gasto)
z.test(x=datos2$gasto, sigma.x=dsm, conf.level=0.99)$conf.int