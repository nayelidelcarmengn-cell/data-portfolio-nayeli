# Nayeli González Novelo

#Sube tu tarea en formato .PDF, incluyendo tu nombre al inicio de la actividad. 
#Las retroalimentaciones se brindan si se entregó la tarea en el tiempo establecido.

#La base de datos sleep contiene tres variables: extra, group y ID, siendo esta última la identidad del individuo. 
#Con base en la prueba que tú elijas: Anova de medidas repetidas o Prueba de Friedman, 
#determina si hay diferencias en el número de horas dormidas antes y después que se les administró el fármaco.
#Reporta los resultados y realiza un gráfico. La base de datos sleep ya se encuentra en R.

data(sleep)
head(sleep)
library(rstatix)
sleep %>% 
  group_by(group) %>% 
  get_summary_stats(extra,type="mean_sd")

# Validación de los supuestos

# De caauerdo con la prueba de Shapiro-Wilk,
# ambas submuestras de extra, grupo 1 y grupo 2, 
# provienen de poblaciones normales
# (submuestra grupo1: valor p =0.408 >0.05; submuestra grupo 2: valor p=0.351 >0.05).

sleep %>% 
  group_by(group) %>% 
  shapiro_test(extra)

# Homocedasticidad

# La prueba de Levene infiere que se cumple la homocedasticidad (estadístico=0.248, valor-p=0.624>0.05).
sleep %>% 
  levene_test(extra~group)

# La prueba anova para muestras repetidas infiere que las 
# medias de los grupos 1 y 2 son distintas (F=16.501 [1,9]; valor p=0.003<0.05).

sleep %>% 
  anova_test(dv= extra,wid=ID, within = group)

# La prueba post-hoc infiere que la diferencia se estima en -4.06 (p.adj=0.003<0.05)

sleep %>% 
  pairwise_t_test(extra~group,
                  paired=T,
                  p.adjust.method="bonferroni")

library(ggstatsplot)
ggwithinstats(data = sleep, x = group, y = extra,type = "parametric",p.adjust.method = "bonferroni", var.equal=T, paired=T)

