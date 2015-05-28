####################################################
### Solutions Exercise Sheet 5                   ###
### Arthur Allignol <arthur.allignol@uni-ulm.de> ###
####################################################


### (a) Read the data ###

dat <- read.csv("data7.csv",
                stringsAsFactors = FALSE)

### Compute a variable hypertension that equals 1 if DIAS > 120 and SYS > 80
dat$hypertension <- factor(as.integer(dat$DIAS > 120 & dat$SYS > 80),
                           levels = c(0, 1),
                           labels = c("No", "Yes"))


### Compute a variable Hypotension that equals 1 if DIAS < 100 and SYS < 65
dat$hypotension <- factor(as.integer(dat$DIAS < 100 & dat$SYS < 65),
                          levels = c(0, 1),
                          labels = c("No", "Yes"))

### Create a variable that equals 1 if the patient’s CITY is in New York state (NY)
dat$city <- factor(as.integer(grepl("NY", dat$CITY, fixed = TRUE)),
                   levels = c(0, 1),
                   labels = c("Not in New York state",
                       "In New York state"))

### Everything in one call
dat <- within(dat,{ 
              hypertension <- factor(as.integer(DIAS > 120 & SYS > 80),
                                     levels = c(0, 1),
                                     labels = c("No", "Yes"))
              hypotension <- factor(as.integer(DIAS < 100 & SYS < 65),
                                    levels = c(0, 1),
                                    labels = c("No", "Yes"))
              city <- factor(as.integer(grepl("NY", CITY, fixed = TRUE)),
                             levels = c(0, 1),
                             labels = c("Not in New York state",
                                 "In New York state"))
              })


### Create a data set that contains the patients that have hypotension
### or hypertension and don’t live in New York state
dat_new <- dat[(dat$hypertension == "Yes" | dat$hypotension == "Yes") & !(dat$city == "In New York state"), ]

