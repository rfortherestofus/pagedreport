pkg_resource <- function(...) {
  system.file("resources", ..., package = "pagedreport", mustWork = TRUE)
}
