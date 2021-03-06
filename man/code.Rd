% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/code.R
\name{code}
\alias{code}
\title{Form the digital code of fossil fuels in accordance with GOST 25543}
\usage{
code(classid, catid, typeid, subtypeid)
}
\arguments{
\item{classid}{identifier of fossil fuel class according to \emph{Table 3} of
\href{http://docs.cntd.ru/document/1200107843}{GOST 25543}.
Type: [\code{character}].}

\item{catid}{identifier of fossil fuel category according to \emph{Table 4} of
\href{http://docs.cntd.ru/document/1200107843}{GOST 25543}.
Type: [\code{character}].}

\item{typeid}{identifier of fossil fuel category according to \emph{Table 5} of
\href{http://docs.cntd.ru/document/1200107843}{GOST 25543}.
Type: [\code{character}].}

\item{subtypeid}{identifier of fossil fuel subtype according to \emph{Table 8} of
\href{http://docs.cntd.ru/document/1200107843}{GOST 25543}.
Type: [\code{character}].}
}
\value{
Digital code according to \emph{Part 7} of
  \href{http://docs.cntd.ru/document/1200107843}{GOST 25543}.
  Type: [\code{character}].
}
\description{
In accordance with
\href{http://docs.cntd.ru/document/1200107843}{GOST 25543} (\emph{part 7})
form the digital code of fossil fuel (brown, or hard coal, or anthracite) on
the basis of its class, category, type, and subtype.
}
\examples{
 # Consider samples of hard coals with the next laboratory
 # measurement results:
 r0   <- c(1.1,  1.3)
 sok  <- c( 43, 76.0)
 vdaf <- c(8.4, 28.3)
 y    <- c(  6,  9.0)

 x <- code(fuel_class(r0), fuel_cat(sok), hard_type(vdaf), hard_subtype(y))
 print(x)
 # [1] "1140806" "1372809"

 # Unit test:
 stopifnot(
   x \%in\% coal.state:::g25543db()$hard$S1KCFx$code
 )
}
