\name{relatorio.mirt}
\alias{relatorio.mirt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Gera relatórios, CSVs e gráficos de uma execução da TRI do pacote mirt
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
relatorio.mirt(respostas, saida, itemtype = "3PL", method = "EM", optimizer = "NR", verbose = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{respostas}{
%%     ~~Describe \code{respostas} here~~
}
  \item{saida}{
%%     ~~Describe \code{saida} here~~
}
  \item{itemtype}{
%%     ~~Describe \code{itemtype} here~~
}
  \item{method}{
%%     ~~Describe \code{method} here~~
}
  \item{optimizer}{
%%     ~~Describe \code{optimizer} here~~
}
  \item{verbose}{
%%     ~~Describe \code{verbose} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (respostas, saida, itemtype = "3PL", method = "EM", 
    optimizer = "NR", verbose = T) 
{
    teste = mirt(respostas, model = 1, itemtype = itemtype, SE = T, 
        SE.type = "BL", method = method, optimizer = optimizer, 
        verbose = verbose)
    print(teste)
    summary(teste)
    pars = print(coef(teste, simplify = T))
    print(coef(teste, simplify = F))
    filenames = c("test_score", "test_info", "test_SE", "test_infoSE")
    charttitles = c("Curva do teste", "Curva de informa<U+00E7><U+00E3>o do teste", 
        "Curva de erro padr<U+00E3>o do teste", "Curvas de informa<U+00E7><U+00E3>o/erro padr<U+00E3>o do teste")
    charttypes = c("score", "info", "SE", "infoSE")
    testplots = data.frame(filenames, charttitles, charttypes, 
        stringsAsFactors = F)
    for (i in 1:nrow(testplots)) {
        pdf(file = paste0(saida, testplots[i, 1], ".pdf"))
        plot(teste, type = testplots[i, 3], main = testplots[i, 
            2])
        dev.off()
    }
    filenames = c("info", "se", "trace", "score", "infoSE", "infotrace")
    charttitles = c("Curva de informa<U+00E7><U+00E3>o do item", 
        "Erro padr<U+00E3>o do item", "Trace do item", "Curva de qtd. de acertos do item", 
        "Curvas de informa<U+00E7><U+00E3>o/erro padr<U+00E3>o do item", 
        "Curvas de informa<U+00E7><U+00E3>o/trace do item")
    charttypes = c("info", "SE", "trace", "score", "infoSE", 
        "infotrace")
    itemplots = data.frame(filenames, charttitles, charttypes, 
        stringsAsFactors = F)
    for (i in 1:ncol(respostas)) {
        for (ii in 1:nrow(itemplots)) {
            pdf(file = paste0(saida, testplots[i, 1], ".pdf"))
            plot(teste, type = testplots[i, 3], main = testplots[i, 
                2])
            itemplot(teste, i, type = itemplots[i, 3], main = paste(itemplots[i, 
                2], "-", i))
            dev.off()
        }
    }
    write.table(pars$items[, 1:3], file = paste0(saida, "parametros.csv"), 
        sep = ",", row.names = F)
    fits = itemfit(teste, X2 = T, method = "ML")
    write.table(fits[, 2:8], file = paste0(saida, "medidas.csv"), 
        sep = ",", row.names = T)
    return(teste)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
