# Cargamos los datos

# Medición previa.
previa <- c(5,4,6,3,4,5,7)
# Medición posterior.
posterior <- c(7,7,6,5,5,6,7)

#Revisión de los supuestos:
diferencias<-previa-posterior
shapiro.test(diferencias)

# Como el valor p >0.5, inferimos que las diferencias provienen de una población normal.

# Aplicamos la prueba t para muestras pareadas:
t.test(previa, posterior, mu=0, paired=T, alternative= "less",conf.level=0.95)


