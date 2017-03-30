library(survival)
fit <- survfit(Surv(TIME, as.numeric(STATUS))~TX, data=u)
plot(fit, lty=1:2, ylab="S(t)", xlab="t", main='Survival Functions')
legend(1500, 1, c("TX=1", "TX=2"), lty=1:2)


# coxph
library(survival)
fix <- coxph(Surv(TIME, as.numeric(STATUS))~., data=u)
plot(survfit(fit))
summary(fit)


# multiple fractional polynomial model
library(mfp)
fit <- mfp(Surv(TIME, as.numeric(STATUS))~fp(AGE, df=4, select=0.05)
        +INST+SEX+TX+GRADE+COND+SITE+T.STAGE+N.STAGE,
        family=cox, data=u)
print(f)
(rsq=1-sum((f$residuals)^2)/sum((u$TIME-mean(u$TIME))^2))