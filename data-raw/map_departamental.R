library(tidyverse)
library(sf)

# fuente: https://datos.gob.hn/dataset/limites-departamentales

map_departamental <- st_read("data-raw/division_departamental_hn/division_departamental_hn.shp")

glimpse(map_departamental)

map_departamental %>%
  ggplot() +
  geom_sf()

usethis::use_data(map_departamental, overwrite = TRUE)
