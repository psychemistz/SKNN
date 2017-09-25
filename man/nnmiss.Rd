\name{nnmiss}
\alias{nnmiss}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
nnmiss(x, xmiss, ismiss, K)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{xmiss}{
%%     ~~Describe \code{xmiss} here~~
}
  \item{ismiss}{
%%     ~~Describe \code{ismiss} here~~
}
  \item{K}{
%%     ~~Describe \code{K} here~~
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
function (x, xmiss, ismiss, K) 
{
    xd <- scale(x, xmiss, FALSE)[, !ismiss]
    dd <- drop(xd^2 \%*\% rep(1, ncol(xd)))
    od <- order(dd)[seq(K)]
    od <- od[!is.na(od)]
    K <- length(od)
    distance <- dd[od]
    s <- sum(1/distance)
    weight <- (1/distance)/s
    xmiss[ismiss] <- drop(weight \%*\% x[od, ismiss, drop = FALSE])
    xmiss
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
