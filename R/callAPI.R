#' Call API
#'
#' Call API endpoint.
#'
#' @inheritParams wef_articles_list
#' @param url URL to call.
#'
#' @examples
#' acc <- wef_sf_accounts()
#'
#' rand_acc <- sample(acc[[1]]$attributes$api_endpoint, 1)
#'
#' data <- wef_call(rand_acc)
#'
#' @return A \code{list}.
#'
#' @export
wef_call <- function(url, pages = 1, n = 25, quiet = !interactive()){

  uri <- paste0(url, "?page%5Bnumber%5D=1&page%5Bsize%5D=", n)

  data <- tryCatch(
    jsonlite::fromJSON(uri),
    error = function(e) e
  )

  if(!isTRUE(quiet) && !inherits(data, "error")){

    if(length(data$meta$pagination) > 0){
      message(
        .c(cli::symbol$dot), " ", crayon::blue("Pages"), .c(": "), crayon::green(data$meta$pagination$total_pages), "\n",
        .c(cli::symbol$dot), " ", crayon::blue("Articles"), .c(": "), crayon::green(data$meta$pagination$total_count)
      )
    }

  } else if(!isTRUE(quiet)){
    message(.c(crayon::red(cli::symbol$cross)), .c(crayon::red(" error")), " on: ", .c(crayon::white(url)))
  }

  if(inherits(data, "error"))
    data <- list()

  results <- list(data$data)

  if(pages > 1){

    for(p in 2:pages){
      uri <- paste0(url, "?&page%5Bsize%5D=", n, "&page%5Bnumber%5D=", p)

      if(!isTRUE(quiet)){
        if(length(data$meta$pagination) > 0){
          message(
            .c(cli::symbol$dot), " ", crayon::blue("Getting page"), .c(": "), crayon::green(p)
          )
        }
      }

      data <- tryCatch(
        jsonlite::fromJSON(uri),
        error = function(e) e
      )

      if(!inherits(data, "error"))
        results <- append(results, list(data$data))
      else if(!isTRUE(quiet))
        message(.c(crayon::red(cli::symbol$cross)), .c(crayon::red(" error")), " on: ", .c(crayon::white(url)))

    }

  }
  results
}
