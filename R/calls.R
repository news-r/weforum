#' Calls
#'
#' Get articles
#'
#' @param n Number of results per page.
#' @param pages Number of pages to retrieve.
#' @param quiet If \code{FALSE} prints useful information to the console.
#' @param channel Channel to retrieve, see \code{\link{valid_channels}}
#' @param type Content type to retrieve, see \code{\link{valid_types}}
#' @param origin Origin to retrieve, see \code{\link{valid_origins}}
#'
#' @section Functions:
#' \itemize{
#'   \item{\code{wef_articles_list} Get articles}
#'   \item{\code{wef_articles_channels} Get articles by channel}
#'   \item{\code{wef_articles_content_types} Get articles by content-type}
#'   \item{\code{wef_articles_origins} Get articles by origin}
#'   \item{\code{wef_collections} Get collections}
#'   \item{\code{wef_communities} Get communities}
#'   \item{\code{wef_events} Get events}
#'   \item{\code{wef_event_sessions} Get events' live sessions}
#'   \item{\code{wef_pages} Get website pages}
#'   \item{\code{wef_projects} Get projects}
#'   \item{\code{wef_reports} Get reports}
#'   \item{\code{wef_sf_accounts} Get Salesforce accounts}
#'   \item{\code{wef_topics} Get topics}
#'   \item{\code{wef_streams} Get streams}
#'   \item{\code{wef_updates} Get updates}
#' }
#'
#' @examples
#' articles <- wef_articles_list()
#'
#' @note Larger pages (\code{n}) take longer to download and are not necessarily more efficient.
#'
#' @return A \code{list} the length of the number of pages retrieved.
#'
#' @rdname calls
#' @export
wef_articles_list <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("articles", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_articles_channels <- function(channel, pages = 1, n = 25, quiet = !interactive()){

  if(missing(channel))
    stop(crayon::red("must pass channel"), call. = FALSE)

  if(!channel %in% valid_channels())
    stop(crayon::red("invalid channel, valid_channels"), call. = FALSE)

  .call_api(paste0("articles/channels", channel), pages, n, quiet)

}

#' @rdname calls
#' @export
wef_articles_content_types <- function(type, pages = 1, n = 25, quiet = !interactive()){

  if(missing(type))
    stop(crayon::red("must pass type"), call. = FALSE)

  if(!type %in% valid_types())
    stop(crayon::red("invalid type, see valid_types"), call. = FALSE)

  .call_api(paste0("articles/content-types", type), pages, n, quiet)

}

#' @rdname calls
#' @export
wef_articles_origins <- function(origin, pages = 1, n = 25, quiet = !interactive()){

  if(missing(origin))
    stop(crayon::red("must pass origin"), call. = FALSE)

  if(!origin %in% valid_origins())
    stop(crayon::red("invalid origin, see valid_origins"), call. = FALSE)

  .call_api(paste0("articles/origins", origin), pages, n, quiet)

}

#' @rdname calls
#' @export
wef_collections <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("collections", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_communities <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("communities", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_events <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("events", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_event_sessions <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("event_sessions", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_pages <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("pages", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_projects <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("projects", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_reports <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("reports", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_sf_accounts <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("sf_accounts", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_topics <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("topics", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_streams <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("streams", pages, n, quiet)

}

#' @rdname calls
#' @export
wef_updates <- function(pages = 1, n = 25, quiet = !interactive()){

  .call_api("updates", pages, n, quiet)

}
