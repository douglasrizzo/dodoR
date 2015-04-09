#' Random Samples of Rows
#' 
#' \code{sample.rows} takes a sample of the specified size from the rows of x
#' using either with or without replacement
#' 
#' It basically does the same as \code{sample}, but returns row samples instead
#' of column samples.
#' 
#' @param x Either a vector of one or more elements from which to choose, or a
#' positive integer.
#' @param size a non-negative integer giving the number of items to choose.
#' @param replace Should sampling be with replacement?
#' @param prob A vector of probability weights for obtaining the elements of
#' the vector being sampled.
#' @return A \code{data.frame} containing \code{size} rows extracted of
#' \code{x}.
#' @author Douglas De Rizzo Meneghetti
#' @references \url{http://stackoverflow.com/questions/8273313/random-rows-in-dataframe-in-r}
#' @keywords sample rows
#' @examples
#' 
#' ##Sample 5 random rows form the cars dataset
#' sample.rows(x = cars, size = 5)
#' 
#' @export sample.rows

sample.rows <-
function(x, size, replace = F, prob = NULL)
{
  return(x[sample(nrow(x), size, replace = replace, prob = prob), ])
}
