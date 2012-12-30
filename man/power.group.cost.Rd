\name{power.group.cost}
\alias{power.group.cost}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Derive the averaged estimated costs of stage II and III and the stage III sample size from the 1000 Monte Carlo simulated functions of a three-stage proteomis study, given a solution of the design parameters
}
\description{
The power.group.cost estimates the average costs at stage II and III and derives the stage III sample size with a user defined solution from the optim.two.stage.group(), or optim.two.stage.appr().
To obtain the cost and stage III sample size, the parameter "optimize" needs to be set to the default value "FALSE". Otherwise, it will give the expected number of proteins with true effect instead. 
}
\usage{
power.group.cost(initial, protein, n1, artifact, budget, s, assaycost2.function, assaycost3.function, recruit, optimize = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{initial}{
A vector of the solution from the optim.two.stage.group(), it comprises of stage I/II t test and F test p value thresholds, and stage II sample size 
}
  \item{protein}{
The protein dataset that needs to have four variables: proteinid, beta, sigma, and group. proteinid is the numerical id for each protein, beta is the mean difference, sigma is the standard deviation of the difference, group is the group that the protein is being assigned.  
The protein dataset needs to have at least 2 proteins.
}
  \item{n1}{
The stage I sample size
}
  \item{artifact}{
The technical artifact correction factor for each protein
}
  \item{budget}{
The budget of the three-stage proteomic study for the stage II verification and stage III clinical validation: It does not include stage I cost
}
  \item{s}{
The slake term of the total budget which is a small amount of dollars that transfers the inequality constraint to an equal constraint. The default value is 1000 dollars.
}
  \item{assaycost2.function}{
The assay cost function of number of proteins (p) and number of patients(n) at stage II
}
  \item{assaycost3.function}{
The assay cost function of number of proteins (p) ONLY at stage III
}
  \item{recruit}{
The recruitment cost for a patient. It is assumed to be the same at each stage. The default value is 100.
}
  \item{optimize}{
A logical variable: when the default value is FALSE, it will output stage III sample size, the costs for stage II and III. When the value sets to TRUE, it will output the expected number of proteins with true effect for the defined solution. 
}
}
\value{
\item{mean.n3 }{The averaged stage III sample size }
\item{mean.stage2.cost }{The averaged stage II cost}
\item{mean.stage3.cost }{The averaged stage III cost}
}
\author{
Irene Suilan Zeng
}
\note{
This function is an additional function for optim.two.stage.group(), it use the same Monte carlo simulated objective function as that in optim.two.stage.group(). Users need to define the same cost functions as that used in the optim.two.stage.group(), and a solution. 
The solution vector can be the optimal solution from optim.two.stage.appr(), or optim.two.stage.group(). It can also be an arbitrary one in the solution space. 
}
\seealso{
power.single.cost(), optim.two.stage.single(), optim.two.stage.appr()
}
\examples{
assaycost2=function(n,p){280*p+1015*n}
assaycost3=function(p){200*p}
protein<-data.frame(proteinid=c(100,101,103,104,105),beta=c(2.4,2.6,0.5,2.6,0.7),sigma=c(0.6,0.7,0.3,0.7,0.4),group=c(1,1,1,2,2))
initial=c(0.01,0.18,0.01,0.05,100)
power.group.cost(initial,protein=protein,artifact=rep(1,5),n1=30,budget=500000,s=1000,assaycost2.function=assaycost2,assaycost3.function=assaycost3,recruit=100,optimize=FALSE)
}
