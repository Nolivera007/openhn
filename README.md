
# `openhn`

<!-- badges: start -->
<!-- badges: end -->

Paquete R de datos económicos y sociales de Honduras los cuales son
obtenidos de las principales instituciones económicas del país y de organismos internacionales. Ordenados en formato Tidy. Este paquete contiene:

* `produccion` : PIB trimestral por enfoque de actividad económica.
* `departamento`: Población, homicidios y tasa de homicidios por 100,000 habitantes en los 18 departamentos de Honduras en 2019.

## Instalación

Puedes instalar `openhn` desde Github con:

``` r
install.packages("devtools")
devtools::install_github("Nolivera007/openhn")

library(openhn)
```

# Ver la documentación

``` r
?openhn
?produccion
?departamento
```

## Ejemplo

```{r}
library(openhn)
library(dplyr)
library(ggplot2)
```

Producción total de cada actividad económica.
```{r}
data(produccion)

produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  ggplot(aes(año, produccion_anual, group = actividad_economica)) +
  geom_line() +
  facet_wrap(.~ actividad_economica)
```

Cálcular la media, la media recortada y la mediana de la población
```{r}
data(departamento)

departamento %>%
  summarise(
    media = mean(poblacion),
    media_recortada = mean(poblacion, trim = 0.1),
    mediana = median(poblacion)
)
```
