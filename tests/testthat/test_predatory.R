library(testthat)
library(predatory)

my.x <- 'Finance'
out <- find.predatory(x = my.x, by = 'name', type.match = 'partial')
test_that(desc = 'Test 1',{
  expect_true(nrow(out)>0)
} )

my.x <- '1947-394X'
out <- find.predatory(x = my.x, by = 'issn', type.match = 'full')
test_that(desc = 'Test 2',{
  expect_true(nrow(out)>0)
} )

