\name{SeqKNN}
\alias{SeqKNN}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
SeqKNN(data, k)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
%%     ~~Describe \code{data} here~~
}
  \item{k}{
%%     ~~Describe \code{k} here~~
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
function (data, k) 
{
    x <- as.matrix(data)
    N <- dim(x)
    p <- N[2]
    N <- N[1]
    nas <- is.na(drop(x \%*\% rep(1, p)))
    xcomplete <- x[!nas, ]
    xbad <- x[nas, , drop = FALSE]
    missing <- c()
    for (i in seq(nrow(xbad))) {
        missing[i] <- sum(is.na(xbad[i, ]))
    }
    missingorder <- order(missing)
    xnas <- is.na(xbad)
    xbadhat <- xbad
    cat(nrow(xbad), fill = TRUE)
    for (i in seq(nrow(xbad))) {
        j <- order(missingorder[i])
        xinas <- xnas[missingorder[i], ]
        xbadhat[missingorder[i], ] <- nnmiss(xcomplete, xbad[missingorder[i], 
            ], xinas, K = k)
        xcomplete <- rbind(xcomplete, xbadhat[missingorder[i], 
            ])
    }
    x[nas, ] <- xbadhat
    x
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
