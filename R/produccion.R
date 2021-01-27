#' Producto Interno Bruto (PIB) por enfoque de actividad económica.
#'
#' PIB trimestral del año 2000-2020 en valores
#' constantes. Datos del Banco Central de Honduras (BCH).
#' Incluye las actividades económicas ordenados en formato Tidy e id para
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
#' @usage data(produccion)
#'
#' @format Un objeto de la clase \code{"data.frame"}
#'
#' @keywords datasets
#'
#' @source Banco Central de Honduras (BCH)
#' \url{https://www.bch.hn/index.php}
#'
#' @examples
#' data(produccion)
#' head(produccion)
#'
"produccion"
