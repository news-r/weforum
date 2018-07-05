<!-- README.md is generated from README.Rmd. Please edit that file -->

# weforum

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

Interface to the [World Economic Forum’s](https://www.weforum.org/)
website [API](https://api.weforum.org/).

## Functions

  - `wef_list`
  - `wef_articles`

## Examples

``` r
library(weforum)

(list <- wef_list())
#> # A tibble: 12 x 2
#>    name           endpoints                                
#>    <chr>          <chr>                                    
#>  1 articles       https://api.weforum.org/v1/articles      
#>  2 collections    https://api.weforum.org/v1/collections   
#>  3 communities    https://api.weforum.org/v1/communities   
#>  4 events         https://api.weforum.org/v1/events        
#>  5 event_sessions https://api.weforum.org/v1/event_sessions
#>  6 pages          https://api.weforum.org/v1/pages         
#>  7 projects       https://api.weforum.org/v1/projects      
#>  8 reports        https://api.weforum.org/v1/reports       
#>  9 sf_accounts    https://api.weforum.org/v1/sf_accounts   
#> 10 topics         https://api.weforum.org/v1/topics        
#> 11 streams        https://api.weforum.org/v1/streams       
#> 12 updates        https://api.weforum.org/v1/updates

articles <- wef_articles()
```
