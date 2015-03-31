sample.rows <-
function(x, size, replace = F, prob = NULL)
{
  return(x[sample(nrow(x), size, replace = replace, prob = prob), ])
}