#' Function for windmill template
#'
#' @param logo Logo
#' @param img Image
#' @param img_to_dark Darken image
#' @param logo_to_white Tranform logo color to white - logo must be SVG
#'
#' @return A pagedown template
#' @export
#'
paged_windmill <-
  function(logo = "0",
           img = "0",
           img_to_dark = TRUE,
           logo_to_white = FALSE) {
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

    # darken img
    if (img_to_dark == TRUE) {
      # opacity
      img_init <-
        magick::image_read(img)
      img_ok <-
        magick::image_colorize(img_init, opacity = 50, color = "black")

      # path to image
      img <- paste0(tempfile("img"), ".jpg")
      magick::image_write(img_ok, img, format = "jpg")
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
      front_cover = c(logo, img),
      back_cover = logo
    )
  }
