#' @import mirt latticeExtra knitr
NULL

#' Enem 2012 Humanities Sciences Keys
#' 
#' The keys for the brazilian National High School Exam humanities sciences
#' test.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' @name ch_keys
#' @docType data
#' @format A data frame with 1 row and 45 cells, each cell containing the key
#' to the corresponding. Values are numerical, ranging from 1 to 5.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(ch_keys)
#' 
NULL





#' Enem 2012 Humanity Sciences Test
#' 
#' Contains 50000 samples of the brazilian National High School Exam. This
#' dataset contains the 45 humanity sciences questions.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' For the creation of these R datasets, the original data, containing all 5.7
#' million observations, was downloaded from the Brazilian Ministry of
#' Education website. A sample of 50000 observations was then taken, composed
#' only of examinees who answered the full test. Note however, that
#' observations from one dataset available in this package does not directly
#' imply that the observations from the other datasets are indeed from the same
#' examinee, that is, the order of observations is randomized.
#' 
#' @name ch
#' @docType data
#' @format A data frame with 50000 observations on the following 45 variables.
#' Rows represent examinees and columns represent items. Each question has a
#' possible answer of 1, 2, 3, 4 or 5, in numerical form.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(ch)
#' 
NULL





#' Enem 2012 Natural Sciences Keys
#' 
#' The keys for the brazilian National High School Exam natural sciences test.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' @name cn_keys
#' @docType data
#' @format A data frame with 1 row and 45 cells, each cell containing the key
#' to the corresponding. Values are numerical, ranging from 1 to 5.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(cn_keys)
#' 
NULL





#' Enem 2012 Natural Sciences Test
#' 
#' Contains 50000 samples of the brazilian National High School Exam. This
#' dataset contains the 45 natural sciences questions.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' For the creation of these R datasets, the original data, containing all 5.7
#' million observations, was downloaded from the Brazilian Ministry of
#' Education website. A sample of 50000 observations was then taken, composed
#' only of examinees who answered the full test. Note however, that
#' observations from one dataset available in this package does not directly
#' imply that the observations from the other datasets are indeed from the same
#' examinee, that is, the order of observations is randomized.
#' 
#' @name cn
#' @docType data
#' @format A data frame with 50000 observations on the following 45 variables.
#' Rows represent examinees and columns represent items. Each question has a
#' possible answer of 1, 2, 3, 4 or 5, in numerical form.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(cn)
#'
NULL




#' R functions I used for my master's thesis
#' 
#' This is a personal package I created in order to automate the generation of
#' reports, charts and CSV files concerning the use of Item Response Theory in
#' a binary matrix of responses.
#' 
#' \tabular{ll}{ Package: \tab dodoR\cr Type: \tab Package\cr Version: \tab
#' 1.0\cr Date: \tab 2015-03-30\cr License: \tab What license is it under?\cr }
#' 
#' @name dodoR-package
#' @aliases dodoR-package dodoR
#' @docType package
#' @author Douglas De Rizzo Meneghetti
#' 
#' Maintainer: Douglas De Rizzo Meneghetti <douglasrizzo@@fei.edu.br>
#' @seealso \code{\link[mirt]{mirt}}
#' @keywords package
NULL






#' Enem 2012 Languages and Codes - Spanish Keys
#' 
#' The keys for the brazilian National High School Exam languages and codes -
#' Spanish test.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' @name lce_keys
#' @docType data
#' @format A data frame with 1 row and 45 cells, each cell containing the key
#' to the corresponding. Values are numerical, ranging from 1 to 5.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(lce_keys)
#' 
NULL





#' Enem 2012 Languages and Codes - Spanish Test
#' 
#' Contains 50000 samples of the brazilian National High School Exam. This
#' dataset contains the 45 languages and codes questions and the last 5 of them
#' are Spanish language questions.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' For the creation of these R datasets, the original data, containing all 5.7
#' million observations, was downloaded from the Brazilian Ministry of
#' Education website. A sample of 50000 observations was then taken, composed
#' only of examinees who answered the full test. Note however, that
#' observations from one dataset available in this package does not directly
#' imply that the observations from the other datasets are indeed from the same
#' examinee, that is, the order of observations is randomized.
#' 
#' @name lce
#' @docType data
#' @format A data frame with 50000 observations on the following 45 variables.
#' Rows represent examinees and columns represent items. Each question has a
#' possible answer of 1, 2, 3, 4 or 5, in numerical form.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(lce)
#' 
NULL





#' Enem 2012 Languages and Codes - English Keys
#' 
#' The keys for the brazilian National High School Exam languages and codes -
#' english test.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' @name lci_keys
#' @docType data
#' @format A data frame with 1 row and 45 cells, each cell containing the key
#' to the corresponding. Values are numerical, ranging from 1 to 5.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(lci_keys)
#' 
NULL





#' Enem 2012 Languages and Codes - English Test
#' 
#' Contains 50000 samples of the brazilian National High School Exam. This
#' dataset contains the 45 languages and codes questions and the last 5 of them
#' are English language questions.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' For the creation of these R datasets, the original data, containing all 5.7
#' million observations, was downloaded from the Brazilian Ministry of
#' Education website. A sample of 50000 observations was then taken, composed
#' only of examinees who answered the full test. Note however, that
#' observations from one dataset available in this package does not directly
#' imply that the observations from the other datasets are indeed from the same
#' examinee, that is, the order of observations is randomized.
#' 
#' @name lci
#' @docType data
#' @format A data frame with 50000 observations on the following 45 variables.
#' Rows represent examinees and columns represent items. Each question has a
#' possible answer of 1, 2, 3, 4 or 5, in numerical form.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(lci)
#' 
NULL





#' Enem 2012 Languages and Codes - Mathematics Keys
#' 
#' The keys for the brazilian National High School Exam languages and codes -
#' Mathematics test.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' @name mt_keys
#' @docType data
#' @format A data frame with 1 row and 45 cells, each cell containing the key
#' to the corresponding. Values are numerical, ranging from 1 to 5.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(mt_keys)
#' 
NULL





#' Enem 2012 Mathematics Test
#' 
#' Contains 50000 samples of the brazilian National High School Exam. This
#' dataset contains the 45 mathematics questions.
#' 
#' The Brazilian National High School Exam (Exame Nacional do Ensino Medio,
#' Enem) is a facultative summative educational evaluation available for every
#' Brazilian citizen that has finished, or is in the last year of high school.
#' The test allows students to enroll in higher degree educational courses.
#' 
#' The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural
#' Sciences, Languages and Codes and Mathematics. Each test is composed of 45
#' multiple-choice items. In the year 2012, the test was taken by
#' approximatelly 5.7 million examinees, whose data is freely available (see
#' Source section).
#' 
#' For the creation of these R datasets, the original data, containing all 5.7
#' million observations, was downloaded from the Brazilian Ministry of
#' Education website. A sample of 50000 observations was then taken, composed
#' only of examinees who answered the full test. Note however, that
#' observations from one dataset available in this package does not directly
#' imply that the observations from the other datasets are indeed from the same
#' examinee, that is, the order of observations is randomized.
#' 
#' @name mt
#' @docType data
#' @format A data frame with 50000 observations on the following 45 variables.
#' Rows represent examinees and columns represent items. Each question has a
#' possible answer of 1, 2, 3, 4 or 5, in numerical form.
#'
#' @source \url{http://portal.inep.gov.br/basica-levantamentos-acessar}
#' @keywords datasets
#' @examples
#' 
#' data(mt)
#' 
NULL
