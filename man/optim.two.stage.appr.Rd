\name{optim.two.stage.appr}
\alias{optim.two.stage.appr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Optimize numbers of discoveries by using an approximated analytical objective function in a multi-stage clinical proteomic study that utilizes biological group information
}
\description{
 This function provides a design solution of a three-stage proteomic study. The solution comprises of the significance levels at stage I/II and sample size at stage II/III, which maximizes the numbers of proteins with true effects in the three-stage proteomic study.
 The differences of this function from the optim.two.stage.group()is that, it uses an approximated analytical objective function instead of the Monte-Carlo simulated objective function to calculate the expected numbers of proteins with true effects.     
 It uses the simulation annealing method that bases on the Metropolis function to determine if a solution shall be accepted at each step in the optimization. 
 The input parameters are the mean difference and its standard deviation in the relative intensity/intensity between the matched case-control for each protein identified from the stage I discovery, the stage I sample size, the cost functions and a vector to define the technical artifact correction.
 A nested simulation annealing method is used to construct multiple sub-searching spaces from the global solution space.
}
\usage{
optim.two.stage.appr(budget, protein, n1, artifact, iter.number, assaycost2.function, assaycost3.function, recruit = 100, a1.t.min = 0.01, a1.t.max = 0.25, a1.f.min = 0.01, a1.f.max = 0.25, a1.step = 0.025, a2.t.min = 0.01, a2.t.max = 0.05, a2.f.min = 0.05, a2.f.max = 0.05, a2.step = 0.025, n2.min = 100, n2.max = 1000, n2.step = 100, n3.min = 1000, n3.max = 5000, n3.step = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{budget}{
The budget of the three-stage proteomic study for the stage II verification and stage III clinical validation: It dose not include stage I cost.
}
  \item{protein}{
The protein dataset: it needs to have four variables: proteinid,beta,sigma,and group. proteinid is the numerical id for each protein. beta is the mean difference. sigma is the standard deviation of the difference. group is the group that the protein is being assigned.  
The protein dataset needs to have at least 2 proteins.
}
  \item{n1}{
The stage I sample size
}
  \item{artifact}{
The technical artifact correction factor for each protein
}
  \item{iter.number}{
The number of iterations for the nested-simulation annealing
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
  \item{a1.t.min}{
The minimal value of stage I t test p value for the solution: The default value is 0.01.
}
  \item{a1.t.max}{
The maximal value of the stage I t test p value for the solution: The default value is 0.25.
}
  \item{a1.f.min}{
The minimal value of the stage I F test p value for the solution: The default value is 0.01.
}
  \item{a1.f.max}{
The maximal value of the stage I F test p value for the solution: The default value is 0.25.
}
  \item{a1.step}{
The interval of the p values for t and F test of stage I: The default value is 0.025.
}
  \item{a2.t.min}{
The minimal value of the stage II t test p value for the solution: The default value is 0.01.
}
  \item{a2.t.max}{
The maximal value of the stage II t test p value for the solution: The default value is 0.05.
}
  \item{a2.f.min}{
The minimal value of the stage II F test p value for the solution: The default value is 0.05.
}
  \item{a2.f.max}{
The maximal value of the stage II F test p value for the solution: The default value is 0.05.
}
  \item{a2.step}{
The interval of the p value for stage II: The default value is 0.025.
}
  \item{n2.min}{
The minimal value of sample size at stage II: The default value is 100.
}
  \item{n2.max}{
The maximal value of sample size at stage II: The default value is 1000.
}
  \item{n2.step}{
The interval of sample size at stage II: The default value is 100.
}
  \item{n3.min}{
The minimal value of sample size at stage III: The default value is 100.
}
  \item{n3.max}{
The maximal value of sample size at stage III: The default value is 1000.
}
  \item{n3.step}{
The interval of sample size at stage III: The default value is 100.
}
}
\value{
solution.matrix 
\item{comp1 }{The number of true positives detected from the third stage}
\item{comp2 }{The stage I T test p value decision threshold}
\item{comp3 }{The stage I F test p value decision threshold}
\item{comp4 }{The stage II T test p value decision threshold}
\item{comp5 }{The stage II F test p value decision threshold}
\item{comp6 }{The sample size at stage II}
\item{comp6 }{The sample size at stage III}
\item{comp7 }{The radius of the search subspace at the final iteration}
\item{comp8 }{from the number 8 component to last component are all solution space boundary parameters}
}
\references{
Babak Abbasi, S. T. A. N., Mehrzad Abdi Khalife, Yasser Faize (2011). "A hyprid Variable neighborhood search and simulated annealing algorithm to estimate the three parameters of the Weibull distribution." Expert Systems with Application 38: 700-708.
Belisle, C. J. P. (1992). "Convergence theorems for a class of simulated annealing algorithm on Rd " Journal of Applied Probability 29: 885-895.
Jorge Nocedal, S. J. W. (1999). Numerical Optimization. New York, Springer.
}
\author{
Irene Suilan Zeng, Thomas Lumley   
}
\seealso{
optim.two.stage.single(), optim.two.stage.group(), power.group.cost()
}
\examples{
## An example of 5 proteins from an immunology proteomic study
assaycost2=function(n,p){280*p+1015*n}
assaycost3=function(p){200*p}
protein<-data.frame(proteinid=c(100,101,103,104,105),beta=c(2.4,2.6,0.5,2.6,0.7),sigma=c(0.6,0.7,0.3,0.7,0.4),group=c(1,1,1,2,2))
optim.two.stage.appr(budget=500000,protein=protein,n1=30,artifact=rep(1,5),iter.number=1,assaycost2.function=assaycost2,assaycost3.function=assaycost3,recruit=100,n2.min=30,n2.max=100,n2.step=10) 
}
