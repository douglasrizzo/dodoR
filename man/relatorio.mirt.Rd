\name{relatorio.mirt}
\alias{relatorio.mirt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate full IRT report based on \code{mirt} package
}
\description{
This function generates a full report of an IRT run of the \code{mirt} package. It plots all possible charts for the test and each of the items; saves item parameters and item fit statistics (like Zhs and X2) into \code{csv} files; and can alternatively be used in conjunction with Sweave to generate a PDF report, since it prints the summaries of all relevant variables during a run.
}
\usage{
relatorio.mirt(respostas, saida, itemtype = "3PL",
               method = "EM", optimizer = "NR", verbose = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{respostas}{
A binary \code{data.frame} in which rows represent examinees and columns represent items.
}
  \item{saida}{
A directory to which all files will be saved. If the directory does not exist, it will be recursively created.
}
  \item{itemtype}{
Item types to be used during parameter estimation. This parameter is passed directly to \code{mirt}. Default is '3PL', the three-parameter logistic model. For more options, consult the \code{mirt} manual.
}
  \item{method}{
Estimation method. This parameter is passed directly to \code{mirt}. Default is 'EM', the Expectation-Maximization algorithm. For more options, consult the \code{mirt} manual.
}
  \item{optimizer}{
Numerical approximation method used for optimizing convergence of estimation. This parameter is passed directly to \code{mirt}. Default is 'NR', the Newton-Raphson method. For more options, consult the \code{mirt} manual.
}
  \item{verbose}{
Defines how much output the algorithm must give. This parameter is passed directly to \code{mirt}. Default is TRUE. For more options, consult the \code{mirt} manual.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
function returns an object of class SingleGroupClass (SingleGroupClass-class)
}
\references{
%% ~put references to the literature/web site here ~
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

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ IRT }
\keyword{ report }% __ONLY ONE__ keyword per line
