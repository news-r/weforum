#' List API calls
#'
#' List all API calls available.
#'
#' @examples
#' wef_list()
#'
#' @return A \link[tibble]{tibble}
#'
#' @export
wef_list <- function(){
  resp <- jsonlite::fromJSON(getOption("weforum.base_url"))$v1
  l <- purrr::map_chr(resp, "list")
  tibble::tibble(
    name = names(l),
    endpoints = l %>% unname()
  )
}
