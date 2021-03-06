% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/anthracite_type.R
\name{anthracite_type}
\alias{anthracite_type}
\title{Determine the type of anthracite in accordance with GOST 25543}
\usage{
anthracite_type(vnudaf)
}
\arguments{
\item{vnudaf}{\emph{volatile matter volume yield}, [\emph{cm^3/g}], measured in
accordance with \href{http://docs.cntd.ru/document/1200024047}{GOST 7303}.
Type: [\code{double}].}
}
\value{
Identifier of anthracite type according to \emph{Table 7} of
  \href{http://docs.cntd.ru/document/1200107843}{GOST 25543}.
  Type: [\code{character}].
}
\description{
In accordance with
\href{http://docs.cntd.ru/document/1200107843}{GOST 25543} (\emph{Table 7})
determine the type of anthracite by \emph{volatile matter volume yield}, [\emph{cm^3/g}].
}
\examples{
anthracite_type(c(0, 99.949, 99.950, 150, 150.049, 150.050, 200, 200.050))
# [1] "05" "05" "10" "10" "10" "15" "15" "20"

# build test:
stopifnot(
  all(
    anthracite_type(c(0, 99.949, 99.950, 150, 150.049, 150.050, 200, 200.050)) ==
    c("05", "05", "10", "10", "10", "15", "15", "20")
  )
)

}
