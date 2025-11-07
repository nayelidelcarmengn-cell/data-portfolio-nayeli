# Sube tu tarea en formato .PDF, incluyendo tu # nombre al inicio de la actividad. 
#Las  retroalimentaciones se brindan si se #entregó la tarea en el tiempo establecido.

#La base de datos ToothGrowth, contiene las #variables len (longitud de los odontoblastos, #células que favorecen el crecimiento de los #dientes), supp (método de administración, #jugo de naranja o ácido ascórbico) y dose #(tres dosis diferentes de vitamina C, 0.5, 1 y #2 mg/day). Esta base ya se encuentra en R por #lo que no debes instalar ninguna librería. 

#Realiza la prueba más adecuada para #determinar si existen diferencias de la #longitud de los odontoblastos en función de #la dosis administrada de vitamina C (dose) y #el método de administración (supp).
#Revisa los supuestos del modelo.
#Realiza los análisis de comparaciones múltiples en caso de ser necesario.
#Realiza el gráfico para presentar los resultados.
#Interpreta los resultados añadiendo los estadísticos asociados a la prueba que utilizaste.

# Preparación de los datos
data("ToothGrowth")
ToothGrowth$supp <- as.factor(ToothGrowth$supp)
ToothGrowth$dose <- as.factor(ToothGrowth$dose)

# Validación de los supuestos.

# Normalidad
library(rstatix)
ToothGrowth %>% 
  group_by(supp,dose) %>% 
  shapiro_test(len)

# Homocedasticidad
ToothGrowth %>% 
  levene_test(len ~ supp*dose)

# Independencia
modelo<- lm(len ~ supp*dose, data =ToothGrowth)
library(lmtest)
dwtest(modelo)

# Realizamos el ANOVA de dos vías:

ToothGrowth %>% 
  anova_test(len ~supp*dose)

# Pruebas post-hoc
ToothGrowth %>% 
  tukey_hsd(len~supp*dose)

