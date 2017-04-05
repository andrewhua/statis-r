
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