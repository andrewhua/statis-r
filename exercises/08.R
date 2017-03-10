a = factor(letters[1:10]);a 
a[3] = "w"
a = as.character(a)
a[3] = "w"
a 
factor(a)
levels(factor(a))
sex = sample(0:1, 10, r=T)
sex = factor(sex); levels(sex)

levels(sex) <- c("Male", "Female"); levels(sex)
sex <- ordered(sex, c("Female", "Male")); sex