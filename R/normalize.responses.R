#' Normalize Range of Responses in a Matrix
#' 
#' Although the use of a non-normalized response-matrix does not
#' interfere in the estimation of IRT parameters, sometimes it is desirable
#' to have item alternatives and its corresponding keys in a normalized range,
#' especially when performing distractor analysis with \code{\link{irt.report}}.
#' 
#' So, for example, a list composed of the values \code{[4, 3, 7]} would
#' become \code{[2, 1, 3]}.
#' @param x A response matrix.
#' @param y A list containing the item keys.
#' @return A \code{list} containing the normalized response matrix in the first
#' slot and its corresponding normalized keys in the second slot.
#' @description \code{normalize.responses} takes a response matrix and its keys
#' and puts its values between [1; n of keys for current item]
#' @author Douglas De Rizzo Meneghetti
#' @keywords normalization responses
#' @export normalize.responses

normalize.responses = function(x, y){
  for(i in 1:ncol(x)){
    keys = sort(t(unique(x[i])))
    new.keys = c(1:length(keys))
    
    for (ii in 1:length(keys)){
      x[i][x[i] == keys[ii]] = new.keys[ii]      
      if(y[i] == keys[ii]) y[i] = new.keys[ii]
    }
  }
  
  return(list(answers = x, keys = y))
}