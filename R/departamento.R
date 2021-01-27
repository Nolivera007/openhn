#' Población, homicidios y tasa de homicidios.
#'
#'
#' \itemize{
#' \item departamento: 18 departamentos de Honduras.
#' \item poblacion: Población.
#' \item homicidios: Total de homcidios.
#' \item tasa_homicidios: Tasa de homicidios por 100,000 habitantes.
#' }
#'
#' @docType data
#'
#' @usage data(departamento)
#'
#' @format Un objeto de la clase \code{"data.frame"}
#'
#' @keywords datasets
#'
#' @source Instituto Nacional de Estadísticas de Honduras (INE)
#' \url{}
#'
#' @examples
#' Cálcule la media, la media recortada y la mediana de la población
#'
#' library(dplyr)
#' library(openhn)
#'
#' data(departamento)
#'
#' departamento %>%
#' summarise(
#'  media = mean(poblacion),
#'  media_recortada = mean(poblacion, trim = 0.1),
#'  mediana = median(poblacion)
#' )
#'
"departamento"
