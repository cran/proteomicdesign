\name{calculate.n3}
\alias{calculate.n3}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A function to calculate the stage III sample size based on the current design parameters
}
\description{
A function to calculate the stage III sample size based on the current design parameters. It is used to reduce the dimensions of the design parameters in the optimization.
The sample size of stage III is calculated by used the known budget, a slack term for the inequality constraint, and the current design parameters from the search. 
}
\usage{
calculate.n3(n2, p2, p3)
}
\arguments{
  \item{n2}{
stage II sample size
}
  \item{p2}{
number of proteins selected from stage I 
}
  \item{p3}{
number of proteins selected from stage II
}
}
