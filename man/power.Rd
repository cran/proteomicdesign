\name{power}
\alias{power}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The power function used in the optim.two.stage.single function
}
\description{
The power function used in the optim.two.stage.single() function. It uses the Monte Carlo simulation to estimate the expected number of detectable proteins with the true effects, and utilize the grouping information. 
}
\usage{
power(initial, optimize = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{initial}{
The current solution selected from the solution space
}
  \item{optimize}{
A logical variable to control the output of the function: When it is true , it will output the expected number of true effects. 
}
}
