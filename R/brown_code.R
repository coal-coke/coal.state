#' Form the digital code for brown coals in accordance with GOST 25543
#'
#' In accordance with
#' \href{http://docs.cntd.ru/document/1200107843}{GOST 25543} (\emph{part 7})
#' form the digital code for \emph{brown coal} using results of laboratory
#' measurements.
#'
#' @param r
#'   reflectance of vitrinite, [\emph{\%}], measured in accordance with
#'   \strong{ISO 7404-5}.
#'   Type: [\code{double}].
#'
#' @param sok
#'   total volume of all \emph{fusinite} fractions, [\emph{\%}].
#'   The next \emph{fusinite} fractions may be considered:
#'   \describe{
#'     \item{\emph{inertinite}}{determined in accordance with \strong{ISO 7404-3}}
#'     \item{two thirds of \emph{semivitrinite}}{determined in accordance with \href{http://docs.cntd.ru/document/1200105478}{GOST R 55662}}
#'   }
#'   Type: [\code{numeric}].
#'
#' @param wmaxaf
#'   maximum \emph{moisture-holding capacity}, [\emph{\%}], measured in
#'   accordance with \strong{ISO 1018}. Type: [\code{double}].
#'
#' @param tscdaf
#'   \emph{yield of tar}, [\emph{\%}], measured in accordance with
#'   \strong{ISO 647} and recalculated on dry ash-free basis.
#'   Type: [\code{double}].
#'
#' @return
#'   Digital code according to \emph{Part 7} of
#'   \href{http://docs.cntd.ru/document/1200107843}{GOST 25543}.
#'   Type: [\code{character}].
#'
#' @export
#'
#' @examples
#'  # Consider four samples of brown coals with the next laboratory
#'  # measurement results:
#'  r0   <- c(.24, .39, .43, .56)
#'  sok  <- c(6, 78, 47, 79)
#'  wmaxaf <- c(53.4, 63.9, 19.2, 24.6)
#'  tscdaf <- c(7.2, 20.9, 5.3, 11.7)
#'
#'  x <- brown_code(r0, sok, wmaxaf, tscdaf)
#'  print(x)
#'  # [1] "0205005" "0376020" "0441005" "0572010"
#'
#'  # Unit test:
#'  stopifnot(
#'    x %in% c(
#'      coal.state:::g25543db()$brown$G1Ex$code,
#'      coal.state:::g25543db()$brown$S3EFx$code
#'    )
#'  )
brown_code <- function(r, sok, wmaxaf, tscdaf){
  checkmate::assert_double(r, 0, 7, any.missing = FALSE, min.len = 1)
  n <- length(r)
  checkmate::assert_numeric(sok, 0, 100, any.missing = FALSE, len = n)
  checkmate::assert_numeric(wmaxaf, 0, 69.9444, any.missing = FALSE, len = n)
  checkmate::assert_double(tscdaf, 0, 100, len = n)

  code(fuel_class(r), fuel_cat(sok), brown_type(wmaxaf), brown_subtype(tscdaf))
}

