source(here::here("R/package-loading.R"))

# Basics of R -------------------------------------------------------------


weight_kilos <- 100
#character vector
c("a" ,"b" ,"c")
#Logic vector
c(TRUE, FALSE, FALSE)
#Numeric vector
c(1, 2, 4)
#factor vector
factor(c("high", "medium", "low"))

head(CO2)
colnames(CO2)
str(CO2)
summary(CO2)
colnames(CO2)

# Object names
DayOne
#no caps and put underscore
day_one

#T = TRUE, so don't name anything T
 <- FALSE
#false <- FALSE

c <- 9
# c is a function name already (combine). Plus c is not descriptive. better to name it somehting descriptive
number_value <- 9


# Spacing
x[, 1]
x[, 1]
# Commas should be in the correct place
# x[,1]
# x[ ,1]
x[, 1]

mean (x, na.rm = TRUE)
mean(x, na.rm = TRUE)
# Spaces should be in the correct place
# mean (x, na.rm = TRUE)
# mean( x, na.rm = TRUE )
mean(x, na.rm = TRUE)

# Add spaces between separate words and symbols
# height <- feet * 12 + inches
height <- feet * 12 + inches

#df = data frame, and $ referes to the data in the data frame, so should be kept together
df$z
x <- 1 : 10
# But don't add spaces interrupting strings of symbols or code
# df $ z
df$z
# x <- 1 : 10
x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
    message("Y is negative")}
# Indenting should be done after if, for, else functions
# if (y < 0 && debug) {
# message("Y is negative")}
if (y < 0 && debug) {
    message("Y is negative")
}
