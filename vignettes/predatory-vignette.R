## ----example1------------------------------------------------------------
library(predatory)

name <- 'Biomedical Laboratory and Clinical Research'
temp <- find.predatory(x = name)
temp


## ----example2------------------------------------------------------------
my.issn <- '00208-0836'
temp <- find.predatory(x = my.issn, by = 'issn')
temp


## ----example3------------------------------------------------------------
my.str <- 'finance'
temp <- find.predatory(x = my.str)
head(temp)


## ----example4------------------------------------------------------------
df.predpub <- get.predpubTable()

head(df.predpub)

str(df.predpub)

