datos <-read.csv("heart_failure_clinical_records_dataset.csv")
str(datos)
edad <-unique(datos$age)

min(edad)
max(edad)
library(dplyr)
datos<-datos %>% mutate(age_rank =
                   case_when(
                     age <=60~"A",
                     age> 60 & age <= 80~"B",
                     age>80 ~"C"))%>%
  select( age_rank,platelets)
head(datos)
write.csv(datos,"plaquetas.csv")
