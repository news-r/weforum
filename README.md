<!-- README.md is generated from README.Rmd. Please edit that file -->

# weforum

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

![weforum
logo](https://www.weforum.org/assets/logo-d8b23e233f85a1af9093a1946e18cff462b0ca82fcd720e2a9633270e53a0bcd.svg)

Interface to the [World Economic Forum’s](https://www.weforum.org/)
website [API](https://api.weforum.org/).

## Install

``` r
devtools::install_git("https://git.weforum.local/JCOE/weforum.git")
```

## Examples

``` r
library(weforum)

wef_endpoints() # list endpoints
#> # A tibble: 15 x 2
#>    name                   endpoints                                       
#>    <chr>                  <chr>                                           
#>  1 articles_list          https://api.weforum.org/v1/articles             
#>  2 articles_channels      https://api.weforum.org/v1/articles/channels    
#>  3 articles_content_types https://api.weforum.org/v1/articles/content-typ~
#>  4 articles_origins       https://api.weforum.org/v1/articles/origins     
#>  5 collections_list       https://api.weforum.org/v1/collections          
#>  6 communities_list       https://api.weforum.org/v1/communities          
#>  7 events_list            https://api.weforum.org/v1/events               
#>  8 event_sessions_list    https://api.weforum.org/v1/event_sessions       
#>  9 pages_list             https://api.weforum.org/v1/pages                
#> 10 projects_list          https://api.weforum.org/v1/projects             
#> 11 reports_list           https://api.weforum.org/v1/reports              
#> 12 sf_accounts_list       https://api.weforum.org/v1/sf_accounts          
#> 13 topics_list            https://api.weforum.org/v1/topics               
#> 14 streams_list           https://api.weforum.org/v1/streams              
#> 15 updates_list           https://api.weforum.org/v1/updates

articles <- wef_articles_list() # get articles
```
