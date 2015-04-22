% (Quick) Introduction to R
% Arthur Allignol



What is R?
==================================================

- R is *an environment for statistical computing and graphics*
	- free software (GPL license)
	- Available for Linux, Solaris, Windows, Mac OSX

- Derived from the S language
  
- http://www.r-project.org/

- The strength of R is its community
	- $\geq$ 6000 packages additional packages implementating the latest
      statistical techniques
	- http://cran.r-project.org/

What is R?
========================================

- R is an interactive language
	- Statements converted to machine instructions as they are
      encountered
	- Flexible but slower than compiled code

- R provides excellent graphics functionality (base graphics and
  additional packages)

- Can be used both as a glorified calculator or as a "real"
  programming language


R as a calculator
========================================


```r
1 + 1
```

```
[1] 2
```

```r
2 + 3 * 4
```

```
[1] 14
```

```r
sqrt(9)
```

```
[1] 3
```

```r
pi
```

```
[1] 3.141593
```


R as a smart calculator
=======================================


```r
x <- 5            #allocate value to an object
x <- 5            #as above
print(x)          # objects in console
```

```
[1] 5
```

```r
x                 #same
```

```
[1] 5
```

```r
a <- sqrt(81)     #square root
b <- exp(2)       #exponential function
c <- log(50)      #logarithm
a * b + c         #basic operations
```

```
[1] 70.41353
```


Getting help
========================================
	
- At the R prompt

```r
help("fun")
?fun
```

- The **sos** package (see next slide for installing packages) and the `findfn` function

- On the internet
	- [R mailing list](https://stat.ethz.ch/mailman/listinfo/r-help)
	- [stackoverflow](http://stackoverflow.com/)
	- [Cross Validated](http://stats.stackexchange.com/)


# Vector operations


```r
# define vector by means of the
# specification of its single elements
W <- c(1,2,3,5,9,7)  
W
```

```
[1] 1 2 3 5 9 7
```

```r
# vector with a 3 (repeated 5 times)
X <- rep(3,5)        
X
```

```
[1] 3 3 3 3 3
```

```r
# combine vectors 
A <- c(W,X)
A
```

```
 [1] 1 2 3 5 9 7 3 3 3 3 3
```

# Vector Operations


```r
# vector with values from 1 to 10 with stepsize 2
Y <- seq(0,10,2)     
Y
```

```
[1]  0  2  4  6  8 10
```

```r
#equals seq(0,10,1)
Z <- 0:10            
Z
```

```
 [1]  0  1  2  3  4  5  6  7  8  9 10
```

```r
# element-wise addition
W+Y
```

```
[1]  1  4  7 11 17 17
```

```r
# element-wise multiplication
W*Y
```

```
[1]  0  4 12 30 72 70
```

```r
# element-wise multiplication with a scalar
5*W               
```

```
[1]  5 10 15 25 45 35
```
