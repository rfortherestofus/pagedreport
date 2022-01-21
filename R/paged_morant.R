#' Function for Morant template
#'
#' @param logo Logo
#' @param other_css Add an other CSS
#' @param ... Arguments passed to pagedown::html_paged
#'
#' @return A pagedown template
#' @export
#'
paged_morant <- function(logo = "0",
                       other_css = NULL,
                       ...){

  # arguments
  main_css <-
    pkg_resource("css/style_morant.css")
  pandoc_html <-
    pkg_resource("html/template_paged.html")

  # default
  if (logo == "0") {
    logo <-
      pkg_resource("logo/square-logo.svg")
  }

  # template
  pagedown::html_paged(
    css = c(other_css, main_css),
    template = pandoc_html,
    front_cover = logo,
    back_cover = logo,
    ...
  )
}
