\name{optim.two.stage.single}
\alias{optim.two.stage.single}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Optimization of the number of discoveries from a multistage clinical proteomic study 
}
\description{
 This function provides the optimal solution to maximize the number of discoveries of a three-stages proteomic study. The solution comprises of the significance levels of the paired t test at stage I/II and the sample sizes at stage II/III that maximizes the expected numbers of proteins with true effects from the multistage studies.
 It uses simulation annealing method that bases on the Metropolis function to determine if a solution shall be accepted at each step. 
 The input parameters are the mean difference and its standard deviation in the relative/absolute quantity for each protein between the paired samples, the stage I sample size  
 and a vector to define the technical artifact correction. A nested simulation annealing method is used to construct the multiple searching sub-space of the global solution space.
}
\usage{
optim.two.stage.single(budget, protein, n1, artifact, iter.number, assaycost2.function, assaycost3.function, recruit = 100, s = 1000, a1.t.min = 0.01, a1.t.max = 0.25, a1.step = 0.025, a2.t.min = 0.01, a2.t.max = 0.05, a2.step = 0.025, n2.min = 100, n2.max = 1000, n2.step = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{budget}{
The budget of the three-stage proteomic study for the stage II verification and stage III clinical validation: It does not include stage I cost.
}
  \item{protein}{
The protein dataset: it needs to have four variables: proteinid,beta,sigma,group. proteinid is the numerical id for each protein, beta is the mean difference, sigma is the standard deviation of the difference, group is the group that the protein is being assigned.  
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
The assay cost function of number of proteins (p) and number of patients(n) at stage II.
}
  \item{assaycost3.function}{
The assay cost function of number of proteins (p) at stage III.
}
  \item{recruit}{
The recruitment cost for a patient assuming it is the same at each stage: the default value is 100.
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
  \item{a1.step}{
The interval of the p values for t test of stage I: the default value is 0.025.
}
  \item{a2.t.min}{
The minimal value of the stage II t test p value for the solution: the default value is 0.01.
}
  \item{a2.t.max}{
The maximal value of the stage II t test p value for the solution: the default value is 0.05.
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
The solutions space is constructed by p values of t test at stage I and stage II, the sample sizes at stage II and III. The ranges of these design parameters are set at the default value and divided into grids by using the .step. 
The protein dataset has the design information for each single protein, in this current version, it assumes the study is a matched case-control or a paired sample study. 
The mean difference and its standard deviation of each protein can be derived from the pilot and other prior information. 
Proteins in the dataset are arranged in the order of the protein ID. The protein ID will be useful in tracking the protein selection at each stage when use the power.single.cost() with the optimize value = FALSE. 
The sample size of stage I is assumed to be known and is a conditional parameter for the optimal design parameters. 
The verification (stage II) sample size is set to be between 100-1000,which is a recommended range in the National Cancer Institute annual report(2007). However, it can have different ranges in different studies (i.e. 10-100).  
The validation(stage III) sample size is conditional on the total budget. The current algorithm used the slack term to convert an inequality problem to an equality problem.
In such setting, the stage III sample size is derived from the approximated budget given the stage I/II design parameters. In another words, it is a solution that assumes we use up all the available fund. 
To identify any other optimal solutions with a smaller budget, a serial of slack terms can be applied.
The ranges of significant levels for paired t-test, F test at stage I and stage II are also user-defined. 
The ranges of all the design parameters will determine the running time of the program. 
}
\value{
solution.matrix 
\item{comp1}{The number of detectable proteins from the third stage}
\item{comp2}{The stage I T test p value decision threshold}
\item{comp3}{The stage II T test p value decision threshold}
\item{comp4}{The sample size at stage II}
\item{comp5}{The radius of the search subspace at the final iteration}
\item{comp6}{from the number 5 component to the last component are all the solution boundary parameters}
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
optim.two.stage.appr(), optim.two.stage.group(), power.single.cost()
}
\examples{
## An example of 5 proteins from an immunology proteomic study
assaycost2=function(n,p){280*p+1015*n}
assaycost3=function(p){200*p}
protein<-data.frame(proteinid=c(100,101,103,104,105),beta=c(2.4,2.6,0.5,2.6,0.7),sigma=c(0.6,0.7,0.3,0.7,0.4))
optim.two.stage.single(budget=500000,artifact=rep(1,5),protein=protein,n1=30,iter.number=1,assaycost2.function=assaycost2,assaycost3.function=assaycost3,n2.min=30,n2.max=100,n2.step=10) 
}	
