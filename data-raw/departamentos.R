library(readr)
library(dplyr)
library(tidyr)

departamento <- read_csv("data-raw/departamento.csv")
head(departamento)

# los datos fueron descargados del INE del censo de 2019 y los himicidios de la sepol
#

usethis::use_data(departamento, overwrite = TRUE)
