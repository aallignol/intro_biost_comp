The television data set
========================================================
author: Arthur Allignol
date: 




Read the data
========================================================

- we read the data using the following command

```r
tele <- read.csv("/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/Television/data/television.csv", 
                 stringsAsFactors = FALSE, na.strings = "*")
```
- and an excerpt of the data is presented below

```r
head(tele)
```

```
     Country life    tv phys fem male
1  Argentina 70.5   4.0  370  74   67
2 Bangladesh 53.5 315.0 6166  53   54
3     Brazil 65.0   4.0  684  68   62
4     Canada 76.5   1.7  449  80   73
5      China 70.0   8.0  643  72   68
6   Colombia 71.0   5.6 1551  74   68
```

The variables
===================================
- `Country` 
- `life` Life expectancy
- `tv` Number of persons per tv set
- `phys` Number of persons per physician

A simple histogram
========================================================


```r
oldpar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
hist(tele$tv, main = "Number of people per TV")
hist(tele$life, main = "Life expectancy")
par(oldpar)
```

![Histograms of {\tt tv} and {\tt phys}](graphics/unnamed-chunk-4-1.png) 

Some maths
==========

We may want to use a linear model to model these data
$$
Y = \beta_0 + \beta_1 \cdot X_1 + \dots + \beta_p \cdot X_p + \varepsilon
$$
