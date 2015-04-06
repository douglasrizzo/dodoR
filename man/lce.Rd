\name{lce}
\alias{lce}
\docType{data}
\title{
Enem 2012 Languages and Codes - Spanish Test
}
\description{
Contains 50000 samples of the brazilian National High School Exam. This dataset contains the 45 languages and codes questions and the last 5 of them are Spanish language questions.
}
\usage{data("lce")}
\format{
  A data frame with 50000 observations on the following 45 variables. Rows represent examinees and columns represent items. Each question has a possible answer of 1, 2, 3, 4 or 5, in numerical form.
}
\details{
The Brazilian National High School Exam (Exame Nacional do Ensino Medio, Enem) is a facultative summative educational evaluation available for every Brazilian citizen that has finished, or is in the last year of high school. The test allows students to enroll in higher degree educational courses.

The exam is composed of 4 dichotomous tests: Humanities Sciences, Natural Sciences, Languages and Codes and Mathematics. Each test is composed of 45 multiple-choice items. In the year 2012, the test was taken by approximatelly 5.7 million examinees, whose data is freely available (see Source section).

For the creation of these R datasets, the original data, containing all 5.7 million observations, was downloaded from the Brazilian Ministry of Education website. A sample of 50000 observations was then taken, composed only of examinees who answered the full test. Note however, that observations from one dataset available in this package does not directly imply that the observations from the other datasets are indeed from the same examinee, that is, the order of observations is randomized.
}
\source{
\url{http://portal.inep.gov.br/basica-levantamentos-acessar}
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(lce)
## maybe str(lce) ; plot(lce) ...
}
\keyword{datasets}
