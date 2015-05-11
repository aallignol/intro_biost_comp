load("data1.rda")

## read data2
dd2 <- read.csv2("data2", stringsAsFactors = FALSE)

## data3
dd3 <- read.delim("data3", stringsAsFactors = FALSE,
                  na.strings = ".")

## data4
dd4 <- read.table("data4", stringsAsFactors = FALSE,
                  sep = "|", dec = ";", na.strings = "?",
                  header = TRUE)

## data5: Fixed width 
dd5 <- read.fwf("data5", stringsAsFactors = FALSE,
                na.strings = c("*", "*         "), header = FALSE,
                widths = c(2, -4, 10, -3, 10, -3, 16, -3, 16, -3, 1, -13, 1, -10, 1, -5, 1, -8, 20),
                as.is = TRUE, sep = "|", skip = 1,
                colClasses = sapply(dd4, class))
names(dd5) <- names(dd4)
## The -X in widths are there to remove the blank spaces between columns.

## data6: After an export from excel to a csv file
col_names <- readLines("data6.csv", n = 2)[2]

col_n <- strsplit(col_names, ",")

dd6 <- read.csv("data6.csv", stringsAsFactors = FALSE,
                na.strings = "", header = FALSE, skip = 7,
                nrows = 50)
names(dd6) <- col_n[[1]]
