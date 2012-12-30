\name{do.one.experiment}
\alias{do.one.experiment}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Simulation function for calculate the expected number of detectable proteins from the three stage proteomic study using group information 
}
\description{
The Monte Carlo simulated objective function for the optim.two.stage.group(). 
}
\usage{
do.one.experiment(initial, optimize = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{initial}{
The design parameters selected at the current search
}
  \item{optimize}{
The logical variable for the output: when it is true, the output is the expected number of proteins with the true effects.  
}
}
