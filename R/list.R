#' Endpoints
#'
#' List all API calls available.
#'
#' @examples
#' wef_endpoints()
#'
#' @return A \link[tibble]{tibble}
#'
#' @export
wef_endpoints <- function(){
  resp <- jsonlite::fromJSON(getOption("weforum.base_url"))$v1
  l <- unlist(resp)
  tibble::tibble(
    name = gsub("\\.", "_", names(l)),
    endpoints = unname(l)
  )
}
