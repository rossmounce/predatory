#' Checks if an issn, name of journal or publisher is registered in Beall's list of predatory journals and publishers
#'
#' This function takes as input a name or issn and looks for a match in a database of predatory journals from Beall's list (https://scholarlyoa.com/).
#' The function can find a name or issn of a particular journal with perfect of partial match. A shiny app is also available (https://msperlin.shinyapps.io/shiny-predatory/).
#'
#' @param x A name or issn for full or partial matching. For the later, the format is XXXX-XXXX. The input is insensitive to capslock.
#' @param by Defines whether to look for x in the names or issn of journals (possible values = c('name_journal','name_publisher','issn'))
#' @param type.match Defines if the function will perform a full or partial match lookup (possible values = c('full','partial'))
#' @param quiet Logical, defines whether to print results to screen or not
#'
#' @return A dataframe with the matched issn or name
#' @export
#'
#' @section Warning:
#'
#' While the database for standalone journals is up to date, the information about predatory publishers is not yet complete since it requires
#' an extensive manual work. The missing data will be regularly included in the upcoming versions of the package. Last update: 2016-12-09.
#'
#' @examples
#' my.name <- 'finance'
#'
#' out <- find.predatory(my.name)
#' print(out)
find.predatory <- function(x, by = 'name_journal', type.match = 'partial', quiet=F){

  # error checking

  possible.types <- c('full','partial')
  if ( !(type.match %in% possible.types)){
    stop(paste0('ERROR: argument type should be one of the following:\n\n', paste(possible.types,collapse = '\n')))
  }

  possible.types <- c('name_journal','name_publisher','issn')
  if ( !(by %in% possible.types)){
    stop(paste0('ERROR: argument by should be one of the following:\n\n', paste(possible.types,collapse = '\n')))
  }

  # check issn
  if (by=='issn'){

    my.extract <- stringr::str_extract_all(x, pattern = '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9xX]')[[1]]

    if (length(my.extract)==0){
      stop('ERROR: The input issn does not follow the proper format (e.g 2473-3423)')
    }

  }

  if ( length(x)>1 ){
    stop('ERROR: The length of x should be 1')
  }

  # load dataset

  df.predpub <- get.predpubTable()

  # start matching

  if (by=='name_journal')   my.matcher <- df.predpub$journal_name
  if (by=='name_publisher') my.matcher <- df.predpub$publisher
  if (by=='issn')           my.matcher <- df.predpub$issn

  x <- stringr::str_to_lower(x)
  my.matcher <- stringr::str_to_lower(my.matcher)

  #browser()

  if (type.match == 'partial'){
    idx.match <- stringr::str_detect(string = my.matcher, pattern = x)
  }

  if (type.match == 'full'){
    idx.match <- my.matcher == x
  }

  temp <- unique(df.predpub[idx.match, ])

  idx <- (rowSums(is.na(temp))==ncol(temp))
  temp <- temp[!idx, ]

  if (!quiet) cat(paste0('\nFound ', nrow(temp), ' row(s)'))

  return(temp)

}

