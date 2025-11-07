# Identificar la clase de interés:
# estudiantes que desertaron por problemas familiares.

# Verificar los supuestos

n<-1000
x <- 823
p0 <- x/n
n*p0
n*(1-p0)

# Construir el intervalo de confianza

prop.test(x=823, n=1000, conf.level=0.99)$conf.int
