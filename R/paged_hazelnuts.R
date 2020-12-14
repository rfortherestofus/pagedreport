#' Function for hazelnuts template
#'
#' @param logo Logo
#' @param front_img Front cover image
#' @param back_img Back cover image
#' @param img_to_dark Darken image
#' @param logo_to_white Tranform logo color to white - logo must be SVG
#'
#' @return A pagedown template
#' @export
#'
paged_hazelnuts <- function(logo = "0",
                            front_img = "0",
                            back_img = "0",
                            img_to_dark = TRUE,
                            logo_to_white = FALSE) {
  # arguments
  main_css <-
    pkg_resource("css/style_hazelnuts.css")
  pandoc_html <-
    pkg_resource("html/template_paged.html")

  # default img
  if (front_img == "0") {
    img <-
      pkg_resource("img/nuts-img.jpg")
  }

  if (back_img == "0") {
    img <-
      pkg_resource("img/hazelnuts-img.jpg")
  }

  if (logo == "0") {
    logo <-
      pkg_resource("logo/square-logo.svg")
  }

  # darken img
  if (img_to_dark == TRUE) {
    # opacity
    front_img_init <-
      magick::image_read(front_img)
    front_img_ok <-
      magick::image_colorize(front_img_init, opacity = 50, color = "black")

    back_img_init <-
      magick::image_read(back_img)
    back_img_ok <-
      magick::image_colorize(back_img_init, opacity = 50, color = "black")

    # path to image
    front_img <- paste0(tempfile("front_img"), ".jpg")
    magick::image_write(front_img_ok, front_img, format = "jpg")

    back_img <- paste0(tempfile("back_img"), ".jpg")
    magick::image_write(back_img_ok, back_img, format = "jpg")
  }

  # logo to white - logo should be svg
  if (logo_to_white == TRUE) {
    logo_init <- magick::image_read_svg(logo)
    logo_ok <-
      magick::image_colorize(logo_init, opacity = 100, color = "white")

    # path to logo
    logo <- paste0(tempfile("logo"), ".svg")
    magick::image_write(logo_ok, logo, format = "svg")
  }

  # template
  pagedown::html_paged(
    css = main_css,
    template = pandoc_html,
    front_cover = c(logo, front_img),
    back_cover = c(logo, back_img),
    toc = TRUE,
    toc_depth = 2
  )

}
