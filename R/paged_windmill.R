#' Function for windmill template
#'
#' @param logo Logo
#' @param img Image
#'
#' @return A pagedown template
#' @export
#'
paged_windmill <- function(logo = "0", img = "0") {
  # arguments
  main_css <-
    system.file("resources/css/style_windmill.css", package = "pagedowntemplate")
  pandoc_html <-
    system.file("resources/html/template_windmill.html", package = "pagedowntemplate")

  # default img
  if (img == "0") {
    img <-
      system.file("resources/img/windmill-img.jpg", package = "pagedowntemplate")
  }

  if (logo == "0") {
    logo <-
      system.file("resources/logo/square-logo.svg", package = "pagedowntemplate")
  }

  # template
  pagedown::html_paged(
    css = main_css,
    template = pandoc_html,
    front_cover = c(logo, img),
    back_cover = logo
  )
}
