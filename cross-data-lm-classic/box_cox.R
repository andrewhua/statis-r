w = read.csv("pharynx.cvs")
w = w[, -c(1,11)]
w = w[w$COND!=9&w$GRADE!=9,]
w$COND[w$COND==3|w$COND==4] = 2
w$COND[w$COND==0]=1
write.csv(w,"pharynx1.csv", quote=F, row.names=F)

u = read.csv("pharynx1.csv")
x = 1:11; (x=x[-c(5,11)])
for(i in x){
    u[,i] = factor(u[,i])
}
a = lm(TIME~., data=u); summary(a)

# -------

library(MASS)
b = boxcox(TIME~., data=u)
I = which(b$y==max(b$y))
b$x[I]

# --------
a = lm(TIME^0.4 ~ INST + SEX + TX + AGE + COND + T.STAGE + N.STAGE + STATUS, data=u); b = step(a)
summary(b); anova(b)
shapiro.test(b$res)