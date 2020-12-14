# inspired by mitchell O'Hara-Wild vitae package : https://github.com/mitchelloharawild/vitae/blob/master/tests/testthat/test-template.R
# inspired by https://github.com/spyrales/gouvdown/blob/master/tests/testthat/test-rmarkdown.R
expect_render <- function(template) {
  outputdir <- tempfile()
  dir.create(outputdir)
  dir.create(file.path(outputdir, 'www'))
  file.copy(
    system.file(
      "rmarkdown",
      "templates",
      template,
      "skeleton",
      "skeleton.Rmd",
      package = "pagedreport"
    ),
    outputdir
  )
  file <- file.path(outputdir, "skeleton.Rmd")
  expect_output(expect_message(
    rmarkdown::render(file,
                      output_dir = outputdir),
    "Output created"
  ),
  "pandoc")
}

# tests
test_that("paged_windmill", {
  expect_render("paged_windmill")
})

test_that("paged_grid", {
  expect_render("paged_grid")
})

test_that("paged_hazelnuts", {
  expect_render("paged_hazelnuts")
})
