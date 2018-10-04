# weforum

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

![weforum
logo](https://www.weforum.org/assets/logo-d8b23e233f85a1af9093a1946e18cff462b0ca82fcd720e2a9633270e53a0bcd.svg)

Interface to the [World Economic Forum’s](https://www.weforum.org/)
website [API](https://api.weforum.org/), containing over 37,000
articles.

## Install

``` r
devtools::install_git("https://git.weforum.local/JCOE/weforum.git")
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

## Basic Example

``` r
library(weforum)

# list endpoints
endpoints <- wef_endpoints() 
knitr::kable(endpoints)
```

| name                     | endpoints                                           |
| :----------------------- | :-------------------------------------------------- |
| articles\_list           | <https://api.weforum.org/v1/articles>               |
| articles\_channels       | <https://api.weforum.org/v1/articles/channels>      |
| articles\_content\_types | <https://api.weforum.org/v1/articles/content-types> |
| articles\_origins        | <https://api.weforum.org/v1/articles/origins>       |
| collections\_list        | <https://api.weforum.org/v1/collections>            |
| communities\_list        | <https://api.weforum.org/v1/communities>            |
| events\_list             | <https://api.weforum.org/v1/events>                 |
| event\_sessions\_list    | <https://api.weforum.org/v1/event_sessions>         |
| pages\_list              | <https://api.weforum.org/v1/pages>                  |
| projects\_list           | <https://api.weforum.org/v1/projects>               |
| reports\_list            | <https://api.weforum.org/v1/reports>                |
| sf\_accounts\_list       | <https://api.weforum.org/v1/sf_accounts>            |
| topics\_list             | <https://api.weforum.org/v1/topics>                 |
| streams\_list            | <https://api.weforum.org/v1/streams>                |
| updates\_list            | <https://api.weforum.org/v1/updates>                |

The above returns basic endpoints, responses from the calls above will
include other endpoints, `weforum` lets you dynamically call those.
Let’s demonstrate with an example.

``` r
# get some articles
articles <- wef_articles_list() 

nrow(articles[[1]])
#> [1] 25
```

This returns a nested list, of 25 articles by default. As explained
above it includes more
endpoints.

``` r
names(articles[[1]]$attributes)[grepl("endpoint", names(articles[[1]]$attributes))]
#> [1] "api_endpoint"         "api_toplink_endpoint" "website_endpoint"
```

You can call those endpoints with `wef_call`.

``` r
data <- purrr::map(articles[[1]]$attributes$api_endpoint, wef_call)

length(data)
#> [1] 25
```
