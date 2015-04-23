########################################################
### R script file to explore the television data set ###
### Arthur Allignol (arthur.allignol@uni-ulm.de)     ###
### Created: 7.5.2014                                ### 
########################################################

tele <- read.csv("/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/Television/data/television.csv", 
                 stringsAsFactors = FALSE, na.strings = "*")

oldpar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
hist(tele$tv, main = "Number of people per TV")
hist(tele$life, main = "Life expectancy")
par(oldpar)

## Country with the highest life expectancy
tele$Country[which.max(tele$life)]

## Country with the lowest life expectancy
tele$Country[which.min(tele$life)]

## Country with the lowest #people per TV
tele$Country[which.min(tele$tv)]

## Country with the highest #people per TV
tele$Country[which.max(tele$tv)]


### Explore the relationship between life expectancy and tv ###
plot(tele$life, tele$tv)

## log of tv
with(tele, plot(life, log(tv)))

cor.test(tele$life, tele$tv)

### Explore the relationship between life expectancy and #physicians ###
with(tele, plot(life, phys))

## log of tv
with(tele, plot(life, log(phys)))

cor.test(tele$life, tele$phys)
 

### Some regression models ###
fit_tele <- lm(life ~ tv, tele)
plot(tele$tv, tele$life)
abline(fit_tele, col = 2)

fit_log_tele <- lm(life ~ I(log(tv)), tele)
with(tele, plot(log(tv), life))
abline(fit_log_tele, col = 2)

fit_log_phys <- lm(life ~ I(log(phys)), tele)

