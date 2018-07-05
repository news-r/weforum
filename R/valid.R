#' Valid
#'
#' Get valid arguments for other calls.
#'
#' @examples
#' valid_channels()
#'
#' @return a \code{list}
#'
#' @rdname validity
#' @export
valid_channels <- function(){
  .get_valid("articles/channels")
}

#' @rdname validity
#' @export
valid_types <- function(){
  .get_valid("articles/content-types")
}

#' @rdname validity
#' @export
valid_origins <- function(){
  .get_valid("articles/origins")
}
