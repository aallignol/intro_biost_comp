##################################################
############    Introduction to R    #############
##################################################

### Generality 
## # please download R on http://www.r-project.org/ (select language of your choice)

## optional: subsequent installation of R-Studio available on http://www.rstudio.com/products/RStudio/#Desk
## my opinion: its a more 'user-friedly' interface

## help function
help() #or type: ?FUNCTION
############### R as a calculator ###############
############### (basic operations) ##############

## R provides additional packages 

###Basics Operations###
x=5               #allocate value to an object
x<-5              #as above
print(x)          # objects in console
x                 #same
a=sqrt(81)        #square root
b=exp(2)          #exponential function
c=log(50)         #logarithm
a*b+c             #basic operations

###Vector Operations
W=c(1,2,3,5,9,7)  #define vector by means of the specification of its single elements
W
X=rep(3,5)        #vector with a 3 (repeteated 5 times)
X
A=c(W,X)          #combine vectors 
A
Y=seq(0,10,2)     #vector with values from 1 to 10 with stepsize 2
Y
Z=0:10            #equals seq(0,10,1)
Z
W+Y               #elementary addition
W*Y               #elementary multiplication
5*W               #elementary multiplication with an scalar
length(W)         #determine length of vector
length(Y)
t(W)%*%Y          #transposition and vector multiplication
W[4]              #select specific element
W[W>2]
W[W>2 & W<7]
which(W>2)        #determine indices where a condition holds

###Matrix Operations
A=matrix(0,nrow=2,ncol=3)   #Initialize 2x3 matrix including 0
A
A[1,3]=5          #allocate single value at position (1,3)
A
A[,2]=c(1,2)      #allocate values to a whole column (analogously with rows)
A
A[-3]             # A without the third element
B=matrix(c(1,1,1,2,2,2,3,3,3),3,3) #Initialize matrix with single values
B
C=diag(c(1,2,3))  #diagonal matrix
C         
B*C               #elementary operations
B+C
B%*%C             #matrix multiplication
A
A=rbind(A,c(0,1,5)) #add row
A
A=cbind(A,c(0,1,4)) #add column
A

###Loops and Conditions####

#for loop
for(i in 1:10){   
  print(i) 
}

W
for(i in W){
  print(i)
}

#while-loop
i=7
while(i<10){      
 print(i)
  i=i+1           #i++ (e.g. in JAVA doesn't work!)!
}

#Conditions
x=8
y=7
if(x<y){          
  print(x)
}else{
  print(y)
}

#Queries
for(i in 1:10){
  if(i %% 2==0 & i<=8){   #queried condition (%% is modulo)
    print(i)
  }
}


###Random Variables in R###

#Normal Distribution
dnorm(x=2, mean = 5, sd = 7)     #Value of a N(5,34) density function of at point x=2
pnorm(q=2, mean = 0, sd = 1)     #Value of a N(0,1) distribution function at point x=2   
qnorm(p=0.25, mean = 0, sd = 1)  #p-quantile of a N(0,1) distribution
x=rnorm(n=50, mean = 0, sd = 1)  #Simulation of 50 N(0,1)-distributed random variables
rnorm(50,0,1)
rnorm(mean=0, sd=1, n=50)
rnorm(0,1,50)

#other distributions
rexp(n=5, rate=1)   #exponential distribution
punif(1.5,1,2)      #Uniform distribution [1,2]

#see https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Distributions.html

###Functions in R####

x=abs(rnorm(50,2,2)) #abs: absolute value
x
#provided functions (selection):
sqrt(x)    #square root
exp(x)     #exponential function
log(x)     #logarithm
sin(x)     #sinus
cos(x)     #cosinus
sort(x)    #sort entries
quantile(x,0.25)  #sample 25%-qunatile

mean(x)    #sample mean
var(x)     #sample variance
sd(x)      #sample standard deviation
sqrt(var(x))
median(x)  #sample median
min(x)     #sample minimum
max(x)     #sample maximum
summary(x) #Overview of important sample parameters

#own functions

#function with one parameter
f=function(x){
  return(x*x+1)
}
f(5)

#function with two parameters
f=function(x,y){
  z=x*y  
  return(x*x+1+y+z)
}
f(5,8)

#faculty by hand: recursive function --> stopping criteria required
faculty=function(n){
  if(n==1){
    return(1)
  }else{
    return(n*faculty(n-1))
  }
}
faculty(4)

################################################
######Data-Input, Processing and plotting#######
################################################

###Input data###
rm(list=ls())  	      # clear workspace
getwd()             	# get the current working directory
setwd("/home/tobias/Lehre/Introduction to Survival Analysis/R-Introduction/")   # set working directory

data=read.table("table1.txt", header=TRUE, sep=" ")
class(data)           #Data type of read.table = data.frame
data                
data$Gender           #extract column gender
data[,1]              #same

#also available: e.g. read.csv()




################# Data Frames ################
x <- c("Franz", "Anton", "Heinrich")                   
y <- c(1.0, 1.7, 2.7)
z <- c(95, 85, 67)
grades_list = data.frame(name=x, grade=y, points=z)                             #create Data Frame
grades_list
grades_list <- rbind(grades_list, data.frame(name="Maria", grade=3.7, points=54)) #add row
grades_list

gender <- c(rep("m", 3), "f")                                                   #create new gender vector
grades_list <- cbind(grades_list, gender)                                       #add column
grades_list

grades_list$points = NULL                                                       #delete column
grades_list

grades_list$gender[2]                                                         #access to single values
grades_list[2,3]

subset(grades_list, gender=="m" & grade<2)                                    #access to subsets

x=subset(grades_list, gender=="m")$grade                                      #determine mean grade of all male individuals
mean(x)

#export data into csv-file without row names
write.csv(grades_list, file="grades_list.csv",  row.names=F)                 

rm(grades_list)                                                                #delete data from working environment
grades_list=read.csv("grades_list.csv", head=T, sep=",")

#input again
grades_list


###Examples: Graphics###

x=c(1,2,4,6,2)
y=c(1,3,6,2,5)
plot(x,y)                 #plot single points (Scatterplot)

y2=c(4,2,5,3,6)
par(mfrow=c(1,2))         #2 Plots within one window
plot(x,y)
plot(x,y2)

par(mfrow=c(1,1))

#plot functions
plot(function(x) dnorm(x,0,1), -5,5) #Standardnormal distribution [-5,5]

plot(function(x) dnorm(x,0,1), -5,5, xlab="x", ylab="f(x)") #set y-axis label 

plot(function(x) dnorm(x,0,1), -5,5, xlab="x", ylab="f(x)", main="Normal Distribution", lwd=2, col="blue") #more formats

#more than one plot within the same coordination system:
plot(function(x) dnorm(x,0,1), -5,5, col="blue")
plot(function(x) dnorm(x,0,2), -5,5, col="red", add=T)

#alternative
x=seq(1,5,0.1)
y=x^2
plot(x,x)
plot(x, x, type="l")

lines(x,y, type="l", col="red")
lines(3,3, type="p", col="blue") #add blue point at (3,3)

#adapt range:
m=max(y)
plot(x,x,type="l", ylim=c(0,m))    #ylim: set range of y-axis
lines(x,y, type="l", col="red")

legend(x=1,y=20, legend=c("Function1", "Function2"), fill=c("black", "red"))   #Legend
legend("topleft", legend=c("Function1", "Function2"), fill=c("black", "red"))  #analogously: bottomleft, topright, bottomright

#additional information for plotting in R etc.: http://de.wikibooks.org/wiki/GNU_R:_plot


