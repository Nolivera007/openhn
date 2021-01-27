#' Población, homicidios y tasa de homicidios.
#'
#' Población, homicidios y tasa de homicidios por 100,000
#' habitantes en los 18 departamentos de Honduras en 2019.
#' Datos del Instituto Nacional de Estadísticas de Honduras y
#' el Sistema Estadistico Policial en Linea.
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
#' \url{https://www.ine.gob.hn/V3/}
#'
#' @source Sistema Estadistico Policial en Linea (SEPOL)
#' \url{https://www.sepol.hn/}
#'
#' @examples
#' 1. Cálcule la media y la mediana de la población.
#'
#' library(dplyr)
#' library(openhn)
#'
#' data(departamento)
#' head(departamento)
#'
#' departamento %>%
#' summarise(
#'  media = mean(poblacion),
#'  mediana = median(poblacion)
#' )
#'
"departamento"
