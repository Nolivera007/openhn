
# `openhn`

<!-- badges: start -->
<!-- badges: end -->

Paquete R de datos económicos y sociales de Honduras los cuales son
obtenidos de las principales instituciones económicas del país y de organismos internacionales. Ordenados en formato Tidy. Este paquete contiene:

* `pib_produccion` : PIB trimestral por enfoque de actividad económica.

## Instalación

Puedes instalar `openhn` desde Github con:

``` r
# install.packages("devtools")
devtools::install_github("Nolivera007/openhn")
```

## Ver la documentación

``` r
?openhn
?pib_produccion
```

## Ejemplo

Algunos ejemplos de gráficos simples:

``` r
library(openhn)
library(dplyr)
library(ggplot2)
library(forcats)

data("pib_produccion")

# 1: Producción total de cada actividad económica

pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  ggplot(aes(año, produccion_anual, group = actividad_economica)) +
  geom_line() +
  facet_wrap(.~ actividad_economica)
  
# 2: Distribución de la producción

pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  ggplot(aes(actividad_economica, produccion_anual, group = actividad_economica)) +
  geom_boxplot() +
  coord_flip()
```

