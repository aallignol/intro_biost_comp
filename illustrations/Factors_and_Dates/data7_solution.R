dat <- read.csv("/data/Ulm/Teaching/SS_2014/Intro_Biostat_Comp/Illustrations/read_data/data7.csv",
                stringsAsFactors = FALSE)

### Age of the patients
dat$entry <- as.Date(dat$ENTRY_D, format = "%d/%m/%Y")
dat$birth <- as.Date(dat$BIRTH, format = "%d%B%Y")

dat$age <- (dat$entry - dat$birth) / 365.25

### Diabetes
dat$Diabetes <- factor(dat$CO_DIABETES, levels = c(0, 1),
                       labels = c("No", "Yes"))

### liver
dat$Liver_Disease <- factor(dat$CO_LIVER, levels = c(0, 1, 2),
                            labels = c("No", "Mild", "Severe"))

### Gender
dat$Gender <- factor(dat$SEX, levels = c(0, 1),
                     labels = c("Female", "Male"))
