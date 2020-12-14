#' Function for grid template
#'
#' @param logo Logo
#'
#' @return A pagedown template
#' @export
#'
paged_grid <- function(logo = "0"){

  # arguments
  main_css <-
    pkg_resource("css/style_grid.css")
  pandoc_html <-
    pkg_resource("html/template_paged.html")

  # default
  if (logo == "0") {
    logo <-
      pkg_resource("logo/square-logo.svg")
  }

  # template
  pagedown::html_paged(
    css = main_css,
    template = pandoc_html,
    front_cover = logo,
    back_cover = logo
  )
}
