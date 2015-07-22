# Chapter 2 Lab: Introduction to R

# Basic Commands

x <- c(1,3,2,5)
x
x = c(1,6,2)
x
y = c(1,4,3)
# How long are the vectors?
length(x)
length(y)
# If the same length we can add them together
x+y
# Check what's in your workspace (clear whatever should not be there)
ls()
rm(x,y)
ls()
rm(list=ls())
# Check for help
?matrix
x=matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x
x=matrix(c(1,2,3,4),2,2)
matrix(c(1,2,3,4),2,2,byrow=TRUE)
sqrt(x)
x^2
# Any operations on a vector or matrix in R are really fast as they are written in C or Fortran
# but do loops are very slow -- learn to use vector or matrix operations, especially with big data

# Simulate data -- are we applying statistical methods correctly and are we understanding it?
x=rnorm(50)
y=x+rnorm(50,mean=50,sd=.1)
hist(x)
hist(y)
plot(x,y)
cor(x,y)

# SET A SEED AT ANY BEGINNING OF AN ANALYSIS -- ESPECIALLY WITH TEST/TRAING DATA
# can always replicate it.
set.seed(1303)
# Generate 50 random variables
rnorm(50)
# Try with a different seed
set.seed(3)
# default mean 0, standard 1
y=rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)


# Basisc Graphics

x=rnorm(100)
y=rnorm(100)
plot(x,y)
# label plots
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")
# Save plot as your favorite file type
pdf("Figure.pdf")
plot(x,y,col="green")
dev.off()

# Generate numbers
x=seq(1,10)
x
x=1:10
x
x=seq(-pi,pi,length=50)
y=x
# contour plot - circle levels correspond to sets of x and y values
f=outer(x,y,function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)

fa=(f-t(f))/2
contour(x,y,fa,nlevels=15)
image(x,y,fa)
# Change the angle of how you like to view it
persp(x,y,fa)
persp(x,y,fa,theta=30)
persp(x,y,fa,theta=30,phi=20)
persp(x,y,fa,theta=30,phi=70)
persp(x,y,fa,theta=30,phi=40)

# Indexing Data

A=matrix(1:16,4,4)
A
# select a cell within the matrix
A[2,3]
# select certain values/columns
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,]
A[,1:2]
A[1,]
A[-c(1,3),]
A[-c(1,3),-c(1,3,4)]
dim(A)

# Loading Data
# if downloaded locally
Auto=read.table("Auto.data")
# if getting directly from the URL
Auto=read.table("http://www-bcf.usc.edu/~gareth/ISL/Auto.data")
fix(Auto)
# Doesn't seem it was read in correctly -- need tell it has a header
Auto=read.table("http://www-bcf.usc.edu/~gareth/ISL/Auto.data",header=T,na.strings="?")
fix(Auto)
Auto=read.csv("Auto.csv",header=T,na.strings="?")
fix(Auto)
dim(Auto)
# look at first 4 rows of the data set
Auto[1:4,]
# since only a few obs are missing within this data set -- delete the rows with missing data
Auto=na.omit(Auto)
dim(Auto)
names(Auto)
# Give me the values of a variable
mpg

# Additional Graphical and Numerical Summaries

plot(cylinders, mpg)
plot(Auto$cylinders, Auto$mpg)
attach(Auto)
plot(cylinders, mpg)
cylinders=as.factor(cylinders)
plot(cylinders, mpg)
plot(cylinders, mpg, col="red")
# Make the boxplots wider/narrower based on the number of obs within a boxplote
plot(cylinders, mpg, col="red", varwidth=T)
# Horizontal orientation
plot(cylinders, mpg, col="red", varwidth=T,horizontal=T)
# labels
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")

#Histograms
hist(mpg)
hist(mpg,col=2)
# Add more bins
hist(mpg,col=2,breaks=15)
# Pair-wise scatterplots
pairs(Auto)
# Subset of the data only
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower,mpg)
# Identify the points in the previous plot when we click on the plot
identify(horsepower,mpg,name)

# Summarize data whole data set
summary(Auto)
# summarize just one variable
summary(mpg)
