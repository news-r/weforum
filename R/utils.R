globalVariables("progress_bar")

.c <- function(x){
  theme <- rstudioapi::getThemeInfo()

  if (isTRUE(theme$dark)) crayon::white(x) else crayon::black(x)
}

.call_api <- function(endpoint, pages, n, quiet, sleep = .5){

  if(sleep < .5){
    cat(crayon::red(cli::symbol$warning), "sleep argument", crayon::yellow("too low"), "- setting to", crayon::green(".5"))
    sleep <- .5
  }

  uri <- paste0(getOption("weforum.base_url"), "/v1/", endpoint, "?page%5Bnumber%5D=1&page%5Bsize%5D=", n)

  if(!isTRUE(quiet)){
    pb <- progress::progress_bar$new(
      format = "  downloading [:bar] :percent eta: :eta",
      total = pages - 1, clear = FALSE, width= 60)
    pb$tick(0)
  }

  data <- jsonlite::fromJSON(uri)

  if(!isTRUE(quiet)){

    if(length(data$meta$pagination) > 0){
      message(
        .c(cli::symbol$dot), " ", crayon::blue("Pages"), .c(": "), crayon::green(data$meta$pagination$total_pages), "\n",
        .c(cli::symbol$dot), " ", crayon::blue("Articles"), .c(": "), crayon::green(data$meta$pagination$total_count)
      )
    }

  }

  results <- list(data$data)

  if(pages > 1){

    for(p in 2:pages){
      uri <- paste0(getOption("weforum.base_url"), "/v1/", endpoint, "?&page%5Bsize%5D=", n, "&page%5Bnumber%5D=", p)

      if(!isTRUE(quiet)){
        if(length(data$meta$pagination) > 0){
          pb$tick()
        }
      }

      Sys.sleep(sleep)

      data <- jsonlite::fromJSON(uri)

      results <- append(results, list(data$data))

    }

  }
  results
}

.get_valid <- function(p){
  uri <- paste0(getOption("weforum.base_url"), "/v1/", p)
  data <- jsonlite::fromJSON(uri)

  gsub(".*/", "", data$api_endpoint) %>% sort()
}
