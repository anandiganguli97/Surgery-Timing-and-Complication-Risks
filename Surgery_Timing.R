#Surgery Timing Analysis
# Load necessary libraries
library(dplyr)

# Read the dataset
data <- read.csv("C:/Users/anand/Downloads/Surgery Timing.csv", stringsAsFactors = FALSE)
str(data)

# Convert key categorical variables to factors with labels
data$gender <- factor(data$gender, levels = c(0, 1), labels = c("Female", "Male"))
data$race <- factor(data$race, levels = c(1, 2, 3), labels = c("Caucasian", "African American", "Other"))
data$asa_status <- factor(data$asa_status, levels = c(1, 2, 3), labels = c("I-II", "III", "IV-VI"))
data$baseline_dementia <- factor(data$baseline_dementia, levels = c(0, 1), labels = c("No dementia", "Dementia"))
data$complication <- factor(data$complication, levels = c(0, 1), labels = c("No", "Yes"))

# Create new derived variables
data$TimeOfDay <- ifelse(as.numeric(data$hour) < 12, "Before Noon", "After Noon")
data$TimeOfDay <- factor(data$TimeOfDay)
data$dow <- factor(data$dow, levels = 1:5,
                   labels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"))
data$month <- factor(data$month, levels = 1:12,
                     labels = c("January", "February", "March", "April", "May", "June",
                                "July", "August", "September", "October", "November", "December"))
data$MonthSummer <- ifelse(data$month %in% c("July", "August"), "July,August", "Other")
data$MonthSummer <- factor(data$MonthSummer)

data$moonphase <- factor(data$moonphase,
                         levels = c(1, 2, 3, 4),
                         labels = c("New moon", "First quarter", "Full moon", "Last quarter"))

# Summary tables by complication status
cat("---- Gender ----\n"); print(table(data$gender, data$complication))
cat("---- Race ----\n"); print(table(data$race, data$complication))
cat("---- ASA_status ----\n"); print(table(data$asa_status, data$complication))
cat("---- Baseline_Dementia ----\n"); print(table(data$baseline_dementia, data$complication))

# Continuous variable summaries
cat("---- Age ----\n"); print(tapply(data$age, data$complication, summary))
cat("---- BMI ----\n"); print(tapply(data$bmi, data$complication, summary))

# Chi-square tests
cat("Chi-square test: Complication vs Time of Day\n")
print(chisq.test(table(data$complication, data$TimeOfDay)))

cat("Chi-square test: Complication vs Day of Week\n")
print(chisq.test(table(data$complication, data$dow)))

cat("Chi-square test: Complication vs Month\n")
print(chisq.test(table(data$complication, data$month)))

cat("Chi-square test: Complication vs Moon Phase\n")
print(chisq.test(table(data$complication, data$moonphase)))

# Logistic regression models for complication prediction

cat("Logistic regression: Complication ~ TimeOfDay\n")
summary(glm(complication ~ TimeOfDay, data = data, family = binomial()))

cat("Logistic regression: Complication ~ Month\n")
summary(glm(complication ~ month, data = data, family = binomial()))

cat("Logistic regression: Complication ~ Day of Week\n")
summary(glm(complication ~ dow, data = data, family = binomial()))

cat("Logistic regression: Complication ~ Moon Phase\n")
summary(glm(complication ~ moonphase, data = data, family = binomial()))


