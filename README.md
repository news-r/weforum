
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

![weforum
logo](https://www.weforum.org/assets/logo-b66768797e3f785791fd157ffc33c27eeca6d5100b7f34d418f50d206f1a8004.svg)

Interface to the World Economic Forum’s
blog API, [the Agenda](https://www.weforum.org/agenda), containing over 40,000
articles.

## Install

``` r
# install.packages("remotes")
remotes::install_github("news-r/weforum")
```

## Functions

  - `wef_articles_list`
  - `wef_articles_channels`
  - `wef_articles_content_types`
  - `wef_articles_origins`
  - `wef_collections`
  - `wef_communities`
  - `wef_events`
  - `wef_event_sessions`
  - `wef_projects`
  - `wef_reports`
  - `wef_sf_accounts`
  - `wef_topics`
  - `wef_streams`
  - `wef_updates`
  - `wef_endpoints`

## Examples

``` r
library(weforum)

# list endpoints
endpoints <- wef_endpoints()
```

The above returns basic endpoints, responses from the calls above will
include other endpoints, `weforum` lets you dynamically call those.
Let’s demonstrate with an example.

``` r
# get some articles
articles <- wef_articles_list() 
#> ․ All Pages: 1259
#> ․ All Objects: 31473

nrow(articles[[1]])
#> [1] 25
```

This returns a nested list, of 25 articles by default. As explained
above it includes more endpoints.

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
