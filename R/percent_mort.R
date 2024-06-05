#' @export

percent_mort <- function(dead, total) {
  return(round(dead / total * 100, 3))
}