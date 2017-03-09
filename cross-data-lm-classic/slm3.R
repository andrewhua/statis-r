w = read.table("data/cofreewy.txt",header=T)
attach(w)
cor(cbind(CO,Traffic,Tsq=Traffic^2,Tcub=Traffic^3,
             Hour,   Hsq=Hour^2,   Hcub=Hour^3,
             Wind,   Wsq=Wind^2,   Wcub=Wind^3))

a = lm(CO~Traffic+Wind+I(Wind^2)+I(Wind^3)+
        sin((2*pi/24)*Hour)+cos((2*pi/24)*Hour)+
        sin((4*pi/24)*Hour)+cos((4*pi/24)*Hour))

b = step(a)
summary(b); anova(b); shapiro.test(b$res)