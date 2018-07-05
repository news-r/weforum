#' Articles
#'
#' Get articles
#'
#' @param n Number of results per page.
#' @param pages Number of pages to retrieve.
#' @param quiet If \code{FALSE} prints useful information to the console.
#'
#' @examples
#' articles <- wef_articles()
#'
#' @note Larger pages (\code{n}) take longer to download and are not necessarily more efficient.
#'
#' @return A \code{list} of articles the length of the number of pages retrieved.
#'
#' @export
wef_articles <- function(pages = 1, n = 25, quiet = !interactive()){

  uri <- paste0(getOption("weforum.base_url"), "/v1/articles?page%5Bnumber%5D=1&page%5Bsize%5D=", n)

  data <- jsonlite::fromJSON(uri)

  if(!isTRUE(quiet)){
    message(
      .c(cli::symbol$dot), " ", crayon::blue("Pages"), .c(": "), crayon::green(data$meta$pagination$total_pages), "\n",
      .c(cli::symbol$dot), " ", crayon::blue("Articles"), .c(": "), crayon::green(data$meta$pagination$total_count)
    )
  }

  results <- list(data$data)

  if(pages > 1){

    for(p in 2:pages){
      uri <- paste0(getOption("weforum.base_url"), "/v1/articles?&page%5Bsize%5D=", n, "&page%5Bnumber%5D=", p)

      if(!isTRUE(quiet)){
        message(
          .c(cli::symbol$dot), " ", crayon::blue("Getting page"), .c(": "), crayon::green(p)
        )
      }

      data <- jsonlite::fromJSON(uri)

      results <- append(results, list(data$data))

    }

  }

  return(results)
}
