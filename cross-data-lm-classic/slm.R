# http://www.statsci.org/data/general/cofreewy.html

# CO =  b0 + b1Hour + b2Traffic + b3Wind + e

cofreewy_data <- read.table("data/cofreewy.txt", header=TRUE)

lm_result <- lm(CO~., cofreewy_data)
summary(lm_result)

step_lm <- step(lm_result, direction="backward")
summary(step_lm)

shapiro.test(step_lm$res)