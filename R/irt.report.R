#' Generate full IRT report based on \code{mirt} package
#' 
#' This function generates a full report of an IRT run of the \code{mirt}
#' package. It plots all possible charts for the test and each of the items;
#' saves item parameters and item fit statistics (like Zhs and X2) into
#' \code{csv} files; and can alternatively be used in conjunction with Sweave
#' to generate a PDF report, since it prints the summaries of all relevant
#' variables during a run.
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param answers A \code{data.frame} containing examinees answers to items.
#' Rows must represent examinees and columns represent items. If the
#' \code{data.frame} is in binary format, \code{keys} is not required, but
#' distractor analysis is not perfoermed.
#' @param out A directory to which all files will be saved. If the directory
#' does not exist, it will be recursively created.
#' @param out.stats The directory to which CSV files will be saved. If the
#' directory does not exist, it will be recursively created. if out.stats =
#' NULL, it will be a subfolder of out.
#' @param out.itemplots The directory to which item plots will be saved. If the
#' directory does not exist, it will be recursively created. if out.itemplots =
#' NULL, it will be a subfolder of out.
#' @param out.testplots The directory to which test plots will be saved. If the
#' directory does not exist, it will be recursively created. if out.testplots =
#' NULL, it will be a subfolder of out.
#' @param out.densities The directory to which parameter density plots will be
#' saved. If the directory does not exist, it will be recursively created. if
#' out.densities = NULL, it will be a subfolder of out.
#' @param keys A vector containing the keys of the test, that is, the right
#' answers for each item in the correct order.
#' @param itemtype Item types to be used during parameter estimation. This
#' parameter is passed directly to \code{mirt}. Default is '3PL', the
#' three-parameter logistic model. For more options, consult the \code{mirt}
#' manual.
#' @param method Estimation method. This parameter is passed directly to
#' \code{mirt}. Default is 'EM', the Expectation-Maximization algorithm. For
#' more options, consult the \code{mirt} manual.
#' @param optimizer Numerical approximation method used for optimizing
#' convergence of estimation. This parameter is passed directly to \code{mirt}.
#' Default is 'NR', the Newton-Raphson method. For more options, consult the
#' \code{mirt} manual.
#' @param verbose Defines how much output the algorithm must give. This
#' parameter is passed directly to \code{mirt}. Default is FALSE. For more
#' options, consult the \code{mirt} manual.
#' @param test_score Whether or not test score plot should be generated.
#' @param test_info Whether or not test information plot should be generated.
#' @param test_SE Whether or not test standard error plot should be generated.
#' @param test_infoSE Whether or not a plot containing both test information
#' and standard error should be generated.
#' @param trace Whether or not item trace plots should be generated.
#' @param info Whether or not item information plots should be generated.
#' @param se Whether or not item standard error plots should be generated.
#' @param score Whether or not item score plots should be generated.
#' @param infoSE Whether or not a plot containing both item information and
#' standard error should be generated.
#' @param infotrace Whether or not a plot containing both item information and
#' trace should be generated.
#' @return function returns an object of class SingleGroupClass
#' (SingleGroupClass-class), the same one returned by the `mirt-package`
#' function `mirt`, in case additional processing is desired beyond the
#' generation of plots and CSV files with parameters
#' @note %% ~~further notes~~
#' @author Douglas De Rizzo Meneghetti
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
#' @references %% ~put references to the literature/web site here ~
#' @keywords IRT report
# @examples

irt.report <-
function  (answers, out, out.stats = NULL, out.itemplots = NULL, 
   out.testplots = NULL, out.densities = NULL, keys = NULL, 
   itemtype = "3PL", method = "EM", optimizer = "NR", verbose = F, 
   test_score = T, test_info = T, test_SE = T, test_infoSE = T, 
   trace = T, info = T, se = T, score = T, infoSE = T, infotrace = T) 
{
  if (is.null(out.stats)) 
    out.stats = paste0(out, "stats/")
  if (is.null(out.itemplots)) 
    out.itemplots = paste0(out, "itemplots/")
  if (is.null(out.testplots)) 
    out.testplots = paste0(out, "testplots/")
  if (is.null(out.testplots)) 
    out.testplots = paste0(out, "densities/")
  dir.create(out.stats, showWarnings = FALSE, recursive = TRUE)
  dir.create(out.itemplots, showWarnings = FALSE, recursive = TRUE)
  dir.create(out.testplots, showWarnings = FALSE, recursive = TRUE)
  dir.create(out.densities, showWarnings = FALSE, recursive = TRUE)
  teste = NULL
  if (is.null(keys)) {
    teste = mirt(answers, model = 1, itemtype = itemtype, 
                 SE = T, SE.type = "BL", method = method, optimizer = optimizer, 
                 verbose = verbose)
  }
  else {
    teste = mirt(key2binary(answers, keys), model = 1, itemtype = itemtype, 
                 SE = T, SE.type = "BL", method = method, optimizer = optimizer, 
                 verbose = verbose)
    nominal = mirt(answers, model = 1, itemtype = "nominal", 
                   verbose = F)
  }
  print(teste)
  summary(teste)
  superpars = coef(teste, simplify = F)
  testplots = c()
  if (test_score) 
    testplots = rbind(testplots, c("test_score", "Curva do teste", 
                                   "score"))
  if (test_info) 
    testplots = rbind(testplots, c("test_info", "Curva de informação do teste", 
                                   "info"))
  if (test_SE) 
    testplots = rbind(testplots, c("test_SE", "Curva de erro padrão do teste", 
                                   "SE"))
  if (test_infoSE) 
    testplots = rbind(testplots, c("test_infoSE", "Curvas de informação/erro padrão do teste", 
                                   "infoSE"))
  for (i in 1:nrow(testplots)) {
    print(plot(teste, type = testplots[i, 3], main = testplots[i, 
                                                               2]))
    dev.copy2pdf(file = paste0(out.testplots, testplots[i, 
                                                        1], ".pdf"))
  }
  pars = coef(teste, simplify = T)
  print(plot(density(pars$items[, 1]), main = "Densidade de a", 
             ylab = "Densidade", xlab = paste("N =", dim(pars$items)[1])))
  dev.copy2pdf(file = paste0(out.testplots, "a.pdf"))
  print(plot(density(pars$items[, 2]), main = "Densidade de b", 
             ylab = "Densidade", xlab = paste("N =", dim(pars$items)[1])))
  dev.copy2pdf(file = paste0(out.testplots, "b.pdf"))
  print(plot(density(pars$items[, 3]), main = "Densidade de c", 
             ylab = "Densidade", xlab = paste("N =", dim(pars$items)[1])))
  dev.copy2pdf(file = paste0(out.testplots, "c.pdf"))
  print(pars)
  itemplots = c()
  if (trace) 
    itemplots = rbind(itemplots, c("trace", "Curva característica do item"))
  if (info) 
    itemplots = rbind(itemplots, c("info", "Curva de informação do item"))
  if (se) 
    itemplots = rbind(itemplots, c("SE", "Erro padrão do item"))
  if (score) 
    itemplots = rbind(itemplots, c("score", "Curva de qtd. de acertos do item"))
  if (infoSE) 
    itemplots = rbind(itemplots, c("infoSE", "Curvas de informação/erro padrão do item"))
  if (infotrace) 
    itemplots = rbind(itemplots, c("infotrace", "Curvas de informação/característica do item"))
  for (i in 1:ncol(answers)) {
    print(superpars[i])
    if (!is.null(keys)) {
      print(itemplot(nominal, i, type = "trace", main = paste("Análise das alternativas do item", 
                                                              "-", i)))
      dev.copy2pdf(file = paste0(out.itemplots, "distractor", 
                                 "_", i, ".pdf"))
    }
    for (ii in 1:nrow(itemplots)) {
      print(itemplot(teste, i, type = itemplots[ii, 1], 
                     main = paste(itemplots[ii, 2], "-", i)))
      dev.copy2pdf(file = paste0(out.itemplots, itemplots[ii, 
                                                          1], "_", i, ".pdf"))
    }
  }
  write.table(pars$items[, 1:3], file = paste0(out.stats, 
                                               "parametros.csv"), sep = ",", row.names = F)
  fits = itemfit(teste, X2 = T, method = "ML")
  write.table(fits[, 2:8], file = paste0(out.stats, "medidas.csv"), 
              sep = ",", row.names = F)
  return(teste)
}