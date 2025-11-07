datos <- read.csv("plaquetas.csv")
library(dplyr)
library(rstatix)

datos %>%
  group_by(age_rank) %>%
  shapiro_test(platelets)

datos %>% 
  levene_test(platelets~age_rank)

datos %>% 
  kruskal_test(platelets~age_rank)
