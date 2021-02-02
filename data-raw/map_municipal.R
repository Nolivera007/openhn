library(tidyverse)
library(sf)

# fuente: https://datos.gob.hn/

map_municipal <- st_read("data-raw/division_municipal_hn/division_municipal_hn.shp")

str(map_municipal)
glimpse(map_municipal)

map_municipal %>%
  ggplot() +
  geom_sf()

usethis::use_data(map_municipal, overwrite = TRUE)
