### Read data7.csv and compute age of the patients
dat <- read.csv("/data/Ulm/Teaching/SS_2015/intro_biostat_comp/illustrations/Factors_and_Dates/data7.csv",
                stringsAsFactors = FALSE)

### Age of the patients
dat$entry <- as.Date(dat$ENTRY_D, format = "%d/%m/%Y")
dat$birth <- as.Date(dat$BIRTH, format = "%d%B%Y")

dat$age <- (dat$entry - dat$birth  ) / 365.25


### Babynames data
require(babynames)
text <- unique(babynames$name)

### 1. all the names starting with L with exactly 2 a's ###
## Start by L with 2 consecutive a's
grep("^L.*a{2}", text, value = TRUE)
## A better solution
grep("^L[^a]*a[^a]*a[^a]*[^a]$", text, value = TRUE)

### 2. All the names with at least 2 y's
grep("y{2,}", text, value = TRUE) ## consecutive 
grep("y.*y.*", text, value = TRUE) ## anywhere in the name

### 3. All names containing either Paris, Berlin or London
grep("((P|p)aris)|((B|b)erlin)|((L|l)ondon)", text, value = TRUE)

## A slightly easier solution using the option ignore.case
grep("(paris)|(berlin)|(london)", text,
     value = TRUE, ignore.case = TRUE)
