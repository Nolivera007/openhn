#' Producción por actividad económica.
#'
#' Datos proporcionados por el Banco Central de Honduras (BCH) que incluye
#' la producción (millones de lempiras)
#' de las actividades económicas trimestral en valores constantes.
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
#' @usage data(produccion)
#'
#' @format Un objeto de la clase \code{data.frame}
#'
#' @keywords datasets
#'
#' @source
#' \href{https://www.bch.hn/}{Banco Central de Honduras (BCH)}
#'
#' @examples
#' data(produccion)
#' head(produccion)
#'
"produccion"
