.onAttach <- function(libname, pkgname) {
  options(weforum.base_url = "https://api.weforum.org/")
}

.onLoad <- function(libname, pkgname) {
  options(weforum.base_url = "https://api.weforum.org/")
}
