# Nayeli González Novelo
# Con la base de datos personalidad.csv, realiza un análisis factorial exploratorio:
#1) ¿La base de datos es factorizable?
# KMO = Kaiser-Meyer-Olkin
# 0 = Tus datos no son candidatos para el AFE
# 1 = Tus datos son candidatos al AFE

# La base de datos sí es factorizable, pues  la prueba de 
# Kaiser-Meyer-Olkin presenta valores mayores que 0.5
# para todas las variables consideradas.


personalidad<- read.csv("personalidad.csv") 
personalidad<- na.omit(personalidad) 
head(personalidad)
library(psych)
KMO(personalidad)

#2) ¿Cuántos factores latentes establece el análisis paralelo?
# De acuerdo con la gráfica obtenida con el análisis paralelo
mat.cor<-cor(personalidad) 
fa.parallel(mat.cor, fa = "fa", n.iter =50)

#3) ¿Qué variables integran cada factor?
# De acuerdo con el análisis factorial, las variables quedarían
#agrupadas como en el siguiente diagrama:
AFE<- fa(personalidad, nfactors=5, rotate = "oblimin")
fa.diagram(AFE)
print(AFE, cut=0.5)
scor <- factor.scores(personalidad, AFE$loadings)
scor
#4) ¿Qué nombre le asignarías a cada factor?
#MR1 = Reacciones negativas
#MR2 = Sociabilidad
#MR3 = Organización
# MR4 = Empatía
# MR5= Pensamiento


#5) ¿Concluyes que el modelo tiene buen ajuste?
# El ajuste es aceptable, ya que, salvo un par de variables, la correlación entre las variables y macrovariables es mayor que 0.5.


