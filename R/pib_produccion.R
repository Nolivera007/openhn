#' Producto Interno Bruto (PIB) por enfoque de actividad económica.
#'
#' PIB trimestral del año 2000-2020 en valores
#' constantes. Datos del Banco Central de Honduras (BCH).
#' Incluye las 15 actividades económicas ordenados en formato Tidy y id para
#' facilitar los cálculos.
#'
#' \itemize{
#' \item id: número del 1 al 15.
#' \item actividad_economica: Concepto.
#' \item trimestre: Trimestre.
#' \item hnl: Millones de Lempiras.
#' }
#'
#' @docType data
#'
#' @usage data(pib_produccion)
#'
#' @format Un objeto de la clase \code{"data.frame"}
#'
#' @keywords datasets
#'
#' @source Banco Central de Honduras (BCH)
#' \url{https://www.bch.hn/index.php}
#'
#' @example
#' library(openhn)
#' library(dplyr)
#' library(ggplot2)
#' library(forcats)
#'
#' data(pib_produccion)
#'
#' pib_produccion %>%
#'  group_by(año, actividad_economica) %>%
#'   summarise(produccion_anual = sum(hnl)) %>%
#'   ggplot(aes(año, produccion_anual, group = actividad_economica)) +
#'   geom_line() +
#'   facet_wrap(.~ actividad_economica)
#'
#' pib_produccion %>%
#'  group_by(año, actividad_economica) %>%
#'   summarise(produccion_anual = sum(hnl)) %>%
#'   ggplot(aes(actividad_economica, produccion_anual, group = actividad_economica)) +
#'   geom_boxplot() +
#'   coord_flip()
#'
#'
"pib_produccion"
