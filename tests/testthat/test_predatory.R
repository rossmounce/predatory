library(testthat)
library(predatory)

my.x <- "Advances in Computational Research"
out <- find.predatory(x = my.x, by = 'name_journal',type.match = 'full')
test_that(desc = 'Test 1',{
  expect_true(nrow(out)>0)
} )

my.x <- 'Finance'
out <- find.predatory(x = my.x, by = 'name_journal', type.match = 'partial')
test_that(desc = 'Test 2',{
  expect_true(nrow(out)>0)
} )

my.x <- '3339-4274'
out <- find.predatory(x = my.x, by = 'issn', type.match = 'full')
test_that(desc = 'Test 3',{
  expect_true(nrow(out)>0)
} )

