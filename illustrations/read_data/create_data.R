####################################################
### Script to create fake data sets              ###
### Arthur Allignol <arthur.allignol@uni-ulm.de> ###
####################################################


require(MASS)
require(boot)

### Variables:
## PAT: patient id: random letters and digits
## ENTRY_D: study entry, Date, well formatted
## BIRTH: birthdate
## DIAS: diastolic
## SYS: Systolic
## CO_DIABETES
## CO_LIVER
## SEX
## CENTER
## City (region)

n <- 50

date1 <- seq(as.Date("1970-1-1"), by = "week", length = 1000)
date2 <- seq(as.Date("2011-3-6"), by = "day", length = 1000)

cities <- c("New York, NY",
            "Kings, NY",
            "Bronx, NY",
            "Queens, NY",
            "San Francisco, CA",
            "Hudson, NJ",
            "Suffolk, MA",
            "Philadelphia, PA",
            "Washington, DC",
            "Alexandria IC, VA")

pat <- 1:50

set.seed(242134)
birth <- sample(date1, 50, replace = FALSE)
entry <- sample(date2, 50, replace = FALSE)
bp <- mvrnorm(50, mu = c(110, 70),
              Sigma = matrix(c(100, 49, 49, 50), ncol = 2, byrow = TRUE))
diab <- rbinom(50, 1, .5)
liver <- rbinom(50, 2, .5)
sex <- rbinom(50, 1, .5)
center <- sample(1:5, 50, replace = TRUE)
city <- sample(cities, 50, replace = TRUE)


dd1 <- data.frame(PAT = pat,
                  ENTRY_D = entry,
                  BIRTH = birth,
                  DIAS = bp[, 1],
                  SYS = bp[, 2],
                  CO_DIABETES = diab,
                  CO_LIVER = liver,
                  SEX = sex,
                  CENTER = center,
                  CITY = city)

set.seed(34234)
dims <- dim(dd1)
mx <- sample(2:dims[1], 20, rep = TRUE)
my <- sample(2:9, 20, rep = TRUE)

for (i in seq_along(mx)) {
    dd1[mx[i], my[i]] <- NA
}

save(dd1, file = "/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/read_data/data1.rda")

write.csv2(dd1, file = "/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/read_data/data2",
           row.names = FALSE)

write.table(dd1,
            file = "/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/read_data/data3",
            sep = "\t", row.names = FALSE, na = ".")

write.table(dd1,
            file = "/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/read_data/data4",
            sep = "|", row.names = FALSE, dec = ";", eol = "\r\n", na = "?")

write.table(dd1, file = "/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/read_data/data5_temp",
            quote = FALSE,
            sep = " & ",
            row.names = FALSE,
            na = "*")


write.csv(dd1, file = "/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/read_data/data6.csv", row.names = FALSE, na = "")

### Create a last data set with other date format
dd2 <- dd1

dd2$ENTRY_D <- format(dd2$ENTRY_D, "%d/%m/%Y")
dd2$BIRTH <- format(dd2$BIRTH, "%d%B%Y")

write.csv(dd2, "/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/read_data/data7.csv", row.names = FALSE)
