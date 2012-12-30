\name{optim.two.stage.group}
\alias{optim.two.stage.group}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Optimization of the design parameters in the discovery , verification and validation stage from a multi-stage clinical proteomic study using biological grouping information
}
\description{
 This function provides the solution for optimizing the number of discoveries in a multistage proteomic study. The solution comprises of the significance levels of the paired t test at stage I/II, the group Hotelling T test at stage I/II and sample size at stage II/III that maximizes numbers of proteins with true effects from the three-stage proteomic study.
 It uses simulation annealing method that bases on the Metropolis function to determine if a solution shall be accepted at each step. 
 The input parameters are the mean difference and its standard deviation for each protein between the matched case-control from the stage I discovery, the group that each protein is assigned, the stage I sample size  
 and a vector to define the technical artifact correction. A nested simulation annealing method is used to construct multiple sub-searching spaces from the global solution space.
}
\usage{
optim.two.stage.group(budget, protein, n1, artifact, iter.number, assaycost2.function, assaycost3.function, recruit = 100, s = 1000, a1.t.min = 0.01, a1.t.max = 0.25, a1.f.min = 0.01, a1.f.max = 0.25, a1.step = 0.025, a2.t.min = 0.01, a2.t.max = 0.05, a2.f.min = 0.05, a2.f.max = 0.05, a2.step = 0.025, n2.min = 100, n2.max = 1000, n2.step = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{budget}{
The budget of the three-stage proteomic study for the stage II verification and stage III clinical validation. It dose not include stage I cost
}
  \item{protein}{
The protein dataset which need to have four variables: proteinid,beta,sigma,group. proteinid is the numerical id for each protein, beta is the mean difference, sigma is the standard deviation of the difference, group is the group that the protein is being assigned.  
The protein dataset need to have at least 2 proteins.
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
The assay cost function of number of proteins (p) at stage III
}
  \item{recruit}{
The recruitment cost for a patient. It is assumed to be the same at each stage. The default value is 100.
}
  \item{s}{
The slake term of the total budget which is a small amount of dollars that transforms the inequality constraint to an equal constraint. The default value is 1000 dollars.
}
  \item{a1.t.min}{
The minimal value of stage I t test p value for the solution: the default value is 0.01.
}
  \item{a1.t.max}{
The maximal value of the stage I t test p value for the solution: the default value is 0.25.
}
  \item{a1.f.min}{
The minimal value of the stage I F test p value for the solution: the default value is 0.01.
}
  \item{a1.f.max}{
The maximal value of the stage I F test p value for the solution: the default value is 0.25.
}
  \item{a1.step}{
The interval of the p values for t and F test of stage I: the default value is 0.025.
}
  \item{a2.t.min}{
The minimal value of the stage II t test p value for the solution: the default value is 0.01.
}
  \item{a2.t.max}{
The maximal value of the stage II t test p value for the solution: the default value is 0.05.
}
  \item{a2.f.min}{
The minimal value of the stage II F test p value for the solution: the default value is 0.05.
}
  \item{a2.f.max}{
The maximal value of the stage II F test p value for the solution: the default value is 0.05.
}
  \item{a2.step}{
The interval of the p value for stage II: the default value is 0.025.
}
  \item{n2.min}{
The minimal value of sample size at stage II: the default value is 100.
}
  \item{n2.max}{
The maximal value of sample size at stage II: the default value is 1000.
}
  \item{n2.step}{
The interval of sample size at stage II: the default value is 100.
}
}
\details{
The solutions space is constructed by p values of t test and Hotelling T test at stage I and stage II, the sample sizes at stage II and III. The ranges of these design parameters are set at the default value and divided into grids by using the .step. 
The protein dataset has the design information for each single protein. In this current version, it assumes the study is a matched case-control or a paired design study. 
The mean difference and its standard deviation of each protein is derived from the pilot and other prior information, the group information for each protein comes from the pathway analysis or the biologist's expert knowledge. 
Proteins in the dataset is arranged in the order of the group and the protein ID. The protein ID will be useful to track the protein selection at each stage when using the power.group.cost() with the optimize value = FALSE. 
The sample size of stage I is assumed to be known and is a conditional parameter for the optimal design parameters. 
The verification (stage II) sample size is set to be between 100-1000,which is a recommended range in the National Cancer Institute guideline. However, it can have different ranges in different studies(i.e. 10-100).  
The validation (stage III) sample size is conditional on the total budget. The current algorithm used the slake term to convert an inequality problem to an equality problem.
In such setting, the stage III sample size at each iteration is derived from the approximated budget given the stage I/II design parameters of the current solution. In another words, it is a solution that assumes we use up all the available fund. 
To identify any other optimal solutions that with a smaller budget, a serial of slack terms can be applied.
The ranges of significant levels for paired t-test, Hotelling T test at stage I and stage II are also user-defined. 
The ranges of all the design parameters will determine the running time of the program. 
}
\value{
solution.matrix 
\item{comp1 }{The number of true positives detected from the third stage}
\item{comp2 }{The stage I T test p value decision threshold}
\item{comp3 }{The stage I F test p value decision threshold}
\item{comp4 }{The stage II T test p value decision threshold}
\item{comp5 }{The stage II F test p value decision threshold}
\item{comp6 }{The sample size at stage II}
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
optim.two.stage.single(), optim.two.stage.appr(), power.group.cost()
}
\examples{
assaycost2=function(n,p){280*p+1015*n}
assaycost3=function(p){200*p}
protein<-data.frame(proteinid=c(100,101,103,104,105),beta=c(2.4,2.6,0.5,2.6,0.7),sigma=c(0.6,0.7,0.3,0.7,0.4),group=c(1,1,1,2,2))
optim.two.stage.group(budget=500000,protein=protein,n1=60,artifact=rep(1,5),iter.number=1,assaycost2.function=assaycost2,assaycost3.function=assaycost3)
}
