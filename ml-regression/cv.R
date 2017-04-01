cv = function(n, Z=10, seed=888) {
    z = rep(1:Z, ceiling(n/Z))[1:n]
    set.seed(seed)
    z = sample(z, n)

    mm = list()
    for(i in 1:Z){
        mm[[i]] = (1:n)[z==i]
    }
    returm(mm)
}

w = read.csv("data/mg.csv")
n = nrow(w)
Z = 10
mm = CV(n, Z)
D = 1