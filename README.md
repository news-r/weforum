
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

Interface to the [World Economic Forum's](https://www.weforum.org/) website [API](https://api.weforum.org/), containing over 40,000 articles.

Install
-------

``` r
# install.packages("remotes")
remotes::install_github("news-r/weforum")
```

Functions
---------

-   `wef_articles_list`
-   `wef_articles_channels`
-   `wef_articles_content_types`
-   `wef_articles_origins`
-   `wef_collections`
-   `wef_communities`
-   `wef_events`
-   `wef_event_sessions`
-   `wef_projects`
-   `wef_reports`
-   `wef_sf_accounts`
-   `wef_topics`
-   `wef_streams`
-   `wef_updates`
-   `wef_endpoints`

Examples
--------

``` r
library(weforum)
#> ℹ No API key is required.

# list endpoints
endpoints <- wef_endpoints()
```

The above returns basic endpoints, responses from the calls above will include other endpoints, `weforum` lets you dynamically call those. Let's demonstrate with an example.

``` r
# get some articles
articles <- wef_articles_list() 
#> ․ All Pages: 1263
#> ․ All Objects: 31554

nrow(articles[[1]])
#> [1] 25
```

This returns a nested list, of 25 articles by default. As explained above it includes more endpoints.

``` r
attr <- articles[[1]]$attributes
names(attr)[grepl("endpoint", names(attr))]
#> [1] "api_endpoint"         "api_toplink_endpoint" "website_endpoint"
```

You can call those endpoints with `wef_call`.

``` r
data <- purrr::map(attr$api_endpoint, wef_call)

length(data)
#> [1] 25
```
