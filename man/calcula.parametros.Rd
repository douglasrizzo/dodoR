\name{calcula.parametros}
\alias{calcula.parametros}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Gera relatórios, CSVs e gráficos de acordo com o ML3 da TRI do pacote LTM
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
calcula.parametros(respostas, saida)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{respostas}{
%%     ~~Describe \code{respostas} here~~
}
  \item{saida}{
%%     ~~Describe \code{saida} here~~
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
function (respostas, saida) 
{
    nItens = ncol(respostas)
    colnames(respostas) = paste0("item ", 1:nItens)
    print(paste0("N<U+00BA> examinandos: ", nrow(respostas)))
    print(paste0("calculando par<U+00E2>metros ", Sys.time()))
    teste = NULL
    resumo = NULL
    while (is.null(resumo)) {
        tryCatch({
            teste = tpm(respostas, type = "latent.trait", IRT.param = TRUE, 
                start.val = "random", max.guessing = 1, na.action = na.exclude)
            resumo = summary(teste)
        }, error = function(e) {
            print(e$message)
        })
    }
    print(resumo)
    parametros = data.frame(a = resumo$coefficients[((nItens * 
        2) + 1):(nItens * 3), 1], b = resumo$coefficients[(nItens + 
        1):(nItens * 2), 1], c = resumo$coefficients[1:nItens, 
        1], row.names = NULL)
    erros = data.frame(a = resumo$coefficients[((nItens * 2) + 
        1):(nItens * 3), 2], b = resumo$coefficients[(nItens + 
        1):(nItens * 2), 2], c = resumo$coefficients[1:nItens, 
        2], row.names = NULL)
    zs = data.frame(a = resumo$coefficients[((nItens * 2) + 1):(nItens * 
        3), 3], b = resumo$coefficients[(nItens + 1):(nItens * 
        2), 3], c = resumo$coefficients[1:nItens, 3], row.names = NULL)
    dir.create(saida, showWarnings = FALSE, recursive = TRUE)
    for (i in 1:nItens) {
        pdf(file = paste0(saida, "cci_", i, ".pdf"))
        plot(teste, type = "ICC", items = i, xlab = "Habilidade", 
            ylab = "Probabilidade", main = paste0("CCI - item ", 
                i))
        dev.off()
        pdf(file = paste0(saida, "cii_", i, ".pdf"))
        plot(teste, type = "IIC", items = i, annot = T, xlab = "Habilidade", 
            ylab = "Informa<U+00E7><U+00E3>o", main = paste0("Curva de Informa<U+00E7><U+00E3>o - item ", 
                i))
        dev.off()
    }
    pdf(file = paste0(saida, "cci_teste.pdf"))
    plot(teste, type = "IIC", items = 0, annot = T, xlab = "Habilidade", 
        ylab = "Informa<U+00E7><U+00E3>o", main = "Curva de informa<U+00E7><U+00E3>o do teste")
    dev.off()
    print("Par<U+00E2>metros:")
    print(summary(parametros))
    pdf(file = paste0(saida, "a.pdf"))
    plot(density(parametros[, 1]), main = "Densidade de a", ylab = "Densidade", 
        xlab = paste("N =", dim(parametros)[1]))
    dev.off()
    pdf(file = paste0(saida, "b.pdf"))
    plot(density(parametros[, 2]), main = "Densidade de b", ylab = "Densidade", 
        xlab = paste("N =", dim(parametros)[1]))
    dev.off()
    pdf(file = paste0(saida, "c.pdf"))
    plot(density(parametros[, 3]), main = "Densidade de c", ylab = "Densidade", 
        xlab = paste("N =", dim(parametros)[1]))
    dev.off()
    print("Erros:")
    print(summary(erros))
    print("Zs:")
    print(summary(zs))
    print(paste("Salvando par<U+00E2>metros", Sys.time()))
    write.table(parametros, file = paste0(saida, "parametros.csv"), 
        sep = ",", row.names = F)
    write.table(erros, file = paste0(saida, "erros.csv"), sep = ",", 
        row.names = F)
    write.table(zs, file = paste0(saida, "zs.csv"), sep = ",", 
        row.names = F)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
