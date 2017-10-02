.onAttach <- function(libname, pkgname) {

  my.message <- paste0('Thank you for using predatory! I also built a simple shiny app with similar funcionality.\n',
                       'It is available at:\n\n',
                      'https://msperlin.shinyapps.io/shiny-predatory/')
  packageStartupMessage(my.message)
}
