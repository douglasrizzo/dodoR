\name{sample.rows}
\alias{sample.rows}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Random Samples of Rows
}
\description{
\code{sample.rows} takes a sample of the specified size from the rows of x using either with or without replacement
}
\usage{
sample(x, size, replace = FALSE, prob = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Either a vector of one or more elements from which to choose, or a positive integer.
}
  \item{size}{
a non-negative integer giving the number of items to choose.
}
  \item{replace}{
Should sampling be with replacement?
}
  \item{prob}{
A vector of probability weights for obtaining the elements of the vector being sampled.
}
}
\details{
It basically does the same as \code{sample}, but returns row samples instead of column samples.
}
\value{
A \code{data.frame} containing \code{size} rows extracted of \code{x}.
}
\references{
\url{http://stackoverflow.com/questions/8273313/random-rows-in-dataframe-in-r}
}
\author{
Douglas De Rizzo Meneghetti
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##Sample 5 random rows form the cars dataset
sample.rows(x = cars, size = 5)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ sample }
\keyword{ rows }% __ONLY ONE__ keyword per line
