% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fuel_class.R
\name{fuel_class}
\alias{fuel_class}
\title{Determine the class of fossil fuels in accordance with GOST 25543}
\usage{
fuel_class(r)
}
\arguments{
\item{r}{reflectance of vitrinite, [\emph{\%}], measured in accordance with
\strong{ISO 7404-5}.
Type: [\code{double}].}
}
\value{
Identifier of fossil fuel class according to \emph{Table 3} of
  \href{http://docs.cntd.ru/document/1200107843}{GOST 25543}.
  Type: [\code{character}].
}
\description{
In accordance with
\href{http://docs.cntd.ru/document/1200107843}{GOST 25543} (\emph{Table 3})
determine the class of fossil fuel (brown, or hard coal, or anthracite) by
its reflectance of vitrinite.
}
\examples{
fuel_class(c(0.20, 0.52, 1.3, 4.99, 4.998))
# [1] "02" "05" "13" "49" "50"

# building test:
stopifnot(
  all(
    fuel_class(c(0.20, 0.52, 1.3, 4.99, 4.998)) ==
    c("02", "05", "13", "49", "50")
  )
)

}
