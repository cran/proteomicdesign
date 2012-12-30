\name{calculate.cost}
\alias{calculate.cost}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Function to calculate the total cost of the multi-stage design
}
\description{
A function to calculate the total cost of the multi-stage design. It is used in the optim.two.stage.appr() as a sub-function. 
}
\usage{
calculate.cost(n2, n3, p1, p2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n2}{
the stage II sample size
}
  \item{n3}{
the stage III sample size
}
  \item{p1}{
the number of proteins selected from stage I
}
  \item{p2}{
the number of proteins selected from stage II
}
}
