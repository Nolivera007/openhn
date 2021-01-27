library(readxl)
library(dplyr)
library(tidyr)
library(tibble)
library(stringr)

# Los datos fueron descargado de la página del Banco Central de Honduras (BCH)
# del Portal de Cuentas Nacionales Trimestrales en la sección Series Históricas
# puedes ver desde el siguiente link: https://see.bch.hn/portalPIBT/Login.aspx?ReturnUrl=%2fportalPIBT%2f
# necesitas crear un usuario y contraseña.
# No es necesarios descargar solo en caso de actulización.


# Importar los datos ------------------------------------------------------

pib <- read_xls(path = "data-raw/ReportesDinamicosPIBProduccion.xls",
                sheet = 2,
                col_names = FALSE,
                range = "A12:DB28"
)

# Renombrar la primera columna

colnames(pib)[1] <- "actividad_economica"

pib %>%
  filter(!str_starts(actividad_economica, "Producto |Valor")) %>%
  mutate(
    actividad_economica = str_remove(actividad_economica, "Menos: |Más: ")
  ) -> pib

# Creamos una columna de id (para mantener, esto facilita el cálculo del pib)
pib %>%
  mutate(id = 1:nrow(pib), .before = actividad_economica) -> pib


# Necesitamos la producción de cada sector para poder cálcular el PIB
# en base a fórmula.


# Obtener la producción de los sectores -----------------------------------

# columnas donde está la suma total (removerla)
anios <- seq(7, ncol(pib), 5)

# ¿Cúantos años tenemos?
length(anios)

# seleccionar los trimetres
pib_trim <- pib %>%
  select(-all_of(anios))

# Renombrar las columas

trimestre <- rep(c("I", "II", "III", "IV"), (ncol(pib_trim) - 1) / 4)

# Comprobar que tengan la mismas longitud

length(trimestre) == ncol(pib_trim) - 2

# Renombrar las columnas de los trimestres
colnames(pib_trim)[3:ncol(pib_trim)] <- trimestre

# Convertir a formato Tidy ------------------------------------------------

# Para mas información sobre Tidy data puedes ver el papers de Hadley Wickham
# link: https://www.jstatsoft.org/article/view/v059i10

pib_trim_tidy <- pib_trim %>%
  pivot_longer(!c(id, actividad_economica), names_to = "trimestre", values_to = "hnl")

# Agregar el año

anios <- rep(2000:2020, rep(4, 21)) # reescribimos la variable anterior
año <- rep(anios, nrow(pib_trim_tidy) / 84) # 84 es total de trimestes

length(año) == nrow(pib_trim_tidy)

# Agregamos la columna año, eliminamos el total y renombramos las

produccion <- tibble(
  pib_trim_tidy,
  año
) %>%
  select(
    id, actividad_economica, año, trimestre, hnl
  )

produccion %>%
  group_by(id, actividad_economica) %>%
  summarise(n = n())

# ver la estructuta del data frame
glimpse(pib_trim_tidy)

# LISTO, ya tenemos la base de datos.

usethis::use_data(produccion, overwrite = TRUE)
