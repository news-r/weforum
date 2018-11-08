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
wef_call <- function(url, pages = 1, n = 25, quiet = !interactive(), sleep = .5){

  uri <- paste0(url, "?page%5Bnumber%5D=1&page%5Bsize%5D=", n)

  if(sleep < .5){
    cat(crayon::red(cli::symbol$warning), "sleep argument", crayon::yellow("too low"), "- setting to", crayon::green(".5"), "\n")
    sleep <- .5
  }

  data <- tryCatch(
    jsonlite::fromJSON(uri),
    error = function(e) e
  )

  if(!isTRUE(quiet) && !inherits(data, "error")){

    if(length(data$meta$pagination) > 0){
      message(
        .c(cli::symbol$dot), " ", crayon::blue("All Pages"), .c(": "), crayon::green(data$meta$pagination$total_pages), "\n",
        .c(cli::symbol$dot), " ", crayon::blue("All Objects"), .c(": "), crayon::green(data$meta$pagination$total_count)
      )
    }

  } else if(!isTRUE(quiet)){
    message(.c(crayon::red(cli::symbol$cross)), .c(crayon::red(" error")), " on: ", .c(crayon::white(url)))
  }

  if(inherits(data, "error"))
    data <- list()

  results <- list(data$data)

  if(pages > 1){

    if(pages > data$meta$pagination$total_pages){
      message(
        crayon::red(cli::symbol$cross), .c(" Requesting more pages than there are ("),
        crayon::red(pages), .c("), setting page to "), crayon::green(data$meta$pagination$total_pages), "\n"
      )
      pages <- data$meta$pagination$total_pages
    }

    if(!isTRUE(quiet)){
      pb <- progress::progress_bar$new(
        format = ":rate downloading page: :current [:bar] :percent eta: :eta",
        total = pages, clear = FALSE, width= 60)
      pb$tick(1)
    }

    for(p in 2:pages){
      uri <- paste0(url, "?&page%5Bsize%5D=", n, "&page%5Bnumber%5D=", p)

      if(!isTRUE(quiet)){
        if(length(data$meta$pagination) > 0){
          pb$tick()
        }
      }

      Sys.sleep(sleep)

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
