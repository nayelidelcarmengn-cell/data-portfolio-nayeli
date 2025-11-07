# Se llevó a cabo un programa para capacitar a artesanos en el marketing digital. Los líderes que impulsaron el programa están interesados en saber si la media de ingresos de los artesanos participantes mejoró.

# Se seleccionan 10 artesanos beneficiarios al azar y se les entrevista con el fin de conocer cuáles fueron sus ingresos un mes después de haber concluido el programa. Puesto que ya se habían registrado sus ingresos mensuales antes del inicio del programa de capacitación, se cuenta con la siguiente información para los 10 artesanos entrevistados:


antes <- rnorm(10,4500,500)
despues <- rnorm(10,4500, 300)

ingresos<-data.frame(antes,despues) 
shapiro.test(antes)
shapiro.test(despues)
prueba<- t.test(ingresos$antes, ingresos$despues, paired=T,alternative="less")

