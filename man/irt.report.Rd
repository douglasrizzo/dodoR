\name{irt.report}
\alias{irt.report}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate full IRT report based on \code{mirt} package
}
\description{
This function generates a full report of an IRT run of the \code{mirt} package. It plots all possible charts for the test and each of the items; saves item parameters and item fit statistics (like Zhs and X2) into \code{csv} files; and can alternatively be used in conjunction with Sweave to generate a PDF report, since it prints the summaries of all relevant variables during a run.
}
\usage{
irt.report(answers, out, out.stats = NULL, out.itemplots = NULL,
           out.testplots = NULL, out.densities = NULL, keys = NULL,
           itemtype='3PL', method = 'EM', optimizer = 'NR',
           verbose = F, test_score = T, test_info = T, test_SE = T,
           test_infoSE = T, trace = T, info = T, se = T, score = T,
           infoSE = T, infotrace = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{answers}{
A \code{data.frame} containing examinees answers to items. Rows must represent examinees and columns represent items. If the \code{data.frame} is in binary format, \code{keys} is not required, but distractor analysis is not perfoermed.
}
  \item{out}{
A directory to which all files will be saved. If the directory does not exist, it will be recursively created.
}
\item{out.stats}{
The directory to which CSV files will be saved. If the directory does not exist, it will be recursively created. if out.stats = NULL, it will be a subfolder of out.
}
\item{out.itemplots}{
The directory to which item plots will be saved. If the directory does not exist, it will be recursively created. if out.itemplots = NULL, it will be a subfolder of out.
}
\item{out.testplots	}{
The directory to which test plots will be saved. If the directory does not exist, it will be recursively created. if out.testplots = NULL, it will be a subfolder of out.
}
\item{out.densities}{
The directory to which parameter density plots will be saved. If the directory does not exist, it will be recursively created. if out.densities = NULL, it will be a subfolder of out.
}
  \item{keys}{
A vector containing the keys of the test, that is, the right answers for each item in the correct order.
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
Defines how much output the algorithm must give. This parameter is passed directly to \code{mirt}. Default is FALSE. For more options, consult the \code{mirt} manual.
}
  \item{test_score}{
Whether or not test score plot should be generated.
  }
  \item{test_info}{
Whether or not test information plot should be generated.
  }
  \item{test_SE}{
Whether or not test standard error plot should be generated.
  }
  \item{test_infoSE}{
Whether or not a plot containing both test information and standard error should be generated.
  }
  \item{trace}{
Whether or not item trace plots should be generated.
  }
  \item{info}{
Whether or not item information plots should be generated.
  }
  \item{se}{
Whether or not item standard error plots should be generated.
  }
  \item{score}{
Whether or not item score plots should be generated.
  }
  \item{infoSE}{
Whether or not a plot containing both item information and standard error should be generated.
  }
  \item{infotrace}{
Whether or not a plot containing both item information and trace should be generated.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
function returns an object of class SingleGroupClass (SingleGroupClass-class), the same one returned by the `mirt-package` function `mirt`, in case additional processing is desired beyond the generation of plots and CSV files with parameters
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
