\name{proteomicdesign-package}
\alias{proteomicdesign-package}
\alias{proteomicdesign}
\docType{package}
\title{
Optimization of a multi stage proteomic study 
}
\description{
This package provides functions to identify the optimal solution that maximizes numbers of detectable disease-differentiated proteins from a multi-stage proteomic study.
This package has three main functions to derive the optimize design parameters under different scenarios in a multi-stage study setting. It assumes that the first stage study has already conducted and the protein parameters and stage I sample size are available.
The current functions are designed for the matched case-control or paired samples design throughout the multi-stages. 

}
\details{
\tabular{ll}{
Package: \tab proteomicdesign\cr
Type: \tab Package\cr
Version: \tab 2.0\cr
Date: \tab 2012-12-30\cr
License: \tab What license is it under? GPL-3\cr
Depends: \tab R,library(MASS)\cr
}
Optim.two.stage.group() is used when group information for each protein is available through the biological pathway or other analyses. It uses Monte Carlo simulation to estimate the expected number of proteins with true effects.
Optim.two.stage.appr() is used when group information for each protein is available as described as above. It uses an approximated analytical function to estimate the expected number of proteins with true effects.  
Optim.two.stage.single() is used when no group information is available. It uses Monte Carlo simulation to estimate the expected number of true effects from the multi-stage design. 
The package has two auxiliary functions that can be use to estimate the cost at the last two stages from the multi-stage study. 
power.group.cost() is used to estimate the stage II and III cost when the design solutions are derived from optim.two.stage.group() and optim.two.stage.appr().
power.single.cost() is used to estimate the stage II and III cost when the design solutions are derived from optim.two.stage.single().
}
\author{
Irene SL Zeng under the supervision of Professor Thomas Lumley
Maintainer: Irene Zeng<i.zeng@auckland.ac.nz>
}
\references{
Babak Abbasi, S. T. A. N., Mehrzad Abdi Khalife, Yasser Faize (2011). "A hyprid Variable neighborhood search and simulated annealing algorithm to estimate the three parameters of the Weibull distribution." Expert Systems with Application 38: 700-708.
Belisle, C. J. P. (1992). "Convergence theorems for a class of simulated annealing algorithm on Rd " Journal of Applied Probability 29: 885-895.
Jorge Nocedal, S. J. W. (1999). Numerical Optimization. New York, Springer.
}
