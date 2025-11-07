# Cargamos los datos

library(readxl)

datos <- read_xlsx("ventasPaginas.xlsx", sheet=1)

plot(datos$Paginas, datos$Ventas, main="Diagrama de dispersion", xlab="Paginas", ylab="Ventas", col="purple")
grid()

cor(datos$Paginas, datos$Ventas)

modelo <- lm(datos$Ventas ~ datos$Paginas)

# E(y) = 7.958*x +101.681
anova(modelo)
summary(modelo)
#Porcentaje de variación de las ventas en función de las páginas donde me anuncio.:  99.28%,

