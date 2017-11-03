#' Returns a dataframe with information about predatory publishers and journals from Bealls webpage
#'
#' This function will return a dataframe with information regarding predatory journals from Beall's site (https://scholarlyoa.com/).
#' The information of predatory publishers has been collected manually, while information on stand-alone journals is catpured by a web scrapping algorithm.
#' BE AWARE that the dataset for publishers is being built over time and it is not yet complete. Last update: 2016-12-09.
#'
#' @return A dataframe with publisher, name of journal and issn of predatory publications
#' @export
#'
#' @section Warning:
#'
#' While the database for standalone journals is up to date, the information about predatory publishers is not yet complete since it requires
#' an extensive manual work. The missing data will be regularly included in the upcoming versions of the package.
#'
#' @examples
#' my.predpub <- get.predpubTable()
#'
#' head(my.predpub)
get.predpubTable <- function(){

  # get file from system

  my.f <- system.file("extdata", 'predpub.csv', package = "predatory")

  # read it!

  my.df <- readr::read_csv(my.f,
                           col_types = readr::cols(issn = readr::col_character(),
                                                   name = readr::col_character(),
                                                   main.url= readr::col_character(),
                                                   type = readr::col_character(),
                                                   ind.url = readr::col_character()) )


  return(my.df)
}

