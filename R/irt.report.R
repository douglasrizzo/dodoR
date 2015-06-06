#' Generate full IRT report based on \code{mirt} package
#' 
#' This function generates a full report of an IRT run of the \code{mirt}
#' package. It plots all possible charts for the test and each of the items;
#' saves item parameters and item fit statistics (like Zhs and X2) into
#' \code{csv} files; and uses a knitr template to generate a PDF report.
#' @param answers A \code{data.frame} containing examinees answers to items.
#' Rows must represent examinees and columns represent items. If the
#' \code{data.frame} is in binary format, \code{keys} is not required, but
#' distractor analysis is not perfoermed.
#' @param out A directory to which all files will be saved. If the directory
#' does not exist, it will be recursively created.
#' @param keys A vector containing the keys of the test, that is, the right
#' answers for each item in the correct order.
#' @param author The author of the document (appears at the report cover)
#' @param title The title of the document (appears at the report cover)
#' @param fscores Whether the function should calculate examinees' scores. If
#' True, results are made available in a file called 'scores.csv' inside the
#' out.stats directory.
#' @param out.stats The directory to which CSV files will be saved. If the
#' directory does not exist, it will be recursively created. if out.stats =
#' NULL, it will be a subfolder of out.
#' @param out.itemplots The directory to which item plots will be saved. If the
#' directory does not exist, it will be recursively created. if out.itemplots =
#' NULL, it will be a subfolder of out.
#' @param out.testplots The directory to which test plots will be saved. If the
#' directory does not exist, it will be recursively created. if out.testplots =
#' NULL, it will be a subfolder of out.
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
#' @author Douglas De Rizzo Meneghetti
#' @keywords IRT report
#' @export irt.report

irt.report = function(answers, out, keys = NULL, author = '', title = 'dodoR - Relatório',
                      fscores = T, out.stats = NULL, out.itemplots = NULL,
                      out.testplots = NULL, method = "EM", optimizer = "NR", verbose = F,
                      test_score = T, test_info = T, test_SE = T, test_infoSE = T,
                      trace = T, info = T, se = T, score = T, infoSE = T, infotrace = T)
{
  dir.create(out, recursive = T, showWarnings = F)
  wd = getwd()
  setwd(tempdir())
  opts_knit$set(root.dir = tempdir())
  knit2pdf(system.file('reports', 'report.Rnw', package = 'dodoR'), output = paste0(tempdir(), '/report.tex'))
  file.rename(paste0(tempdir(), '/report.pdf'), paste0(out, 'report.pdf'))
  setwd(wd)
}