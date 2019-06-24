.onAttach <- function(libname, pkgname) {
  options(weforum.base_url = "https://api.weforum.org/")
  packageStartupMessage(
    crayon::blue(cli::symbol$info), " No API key is required."
  )
}

.onLoad <- function(libname, pkgname) {
  options(weforum.base_url = "https://api.weforum.org/")
}
