
w2 = read.csv("data/column.2C.csv")
a = glm(V7~., w2, family="binomial")
b = step(a)
summary(b)

BI = function(D, w, ff, fm="binomial"){
    a = glm(ff, w, family=fm)
    z = predict(a, w, type="response");
    ee = NULL
    for(p in seq(.1, .9, .01)){
        u = rep(levels(wp[,D])[2], nrow(w))
        u[!(z>p)] = levels(w[,D])[1]
        e = sum(u!=w[,D])/nrow(w)
        ee = rbind(ee, c(p, e))
    }
    I = which(ee[,2]==min(ee[,2]))
    P = ee[min(I), 1]
    return(ee[min(I),])
}

p.2C = BI(7, w2, V7~.)

D = 7
p = p.2C[1]
a = glm(V7~., w2, family="binomial")
z = (predict(a, w2, type="response"))
u = rep(levels(w[,D])[2], nrow(w))
u[!(z>p)]=levels(w[,D])[1]
(zz = table(w2[,7], u))
(sum(zz) - sum(diag(zz)))/sum(zz)
