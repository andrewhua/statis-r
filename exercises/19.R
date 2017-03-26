primes = function(n = 100) {
    z <- 2
    for(i in 2:n)
        if (any(i%%2:(i-1)==0)==F) 
            z <- c(z, i); return(z)
}

fix(primes)

primes()

# t1 = Sys.time()
# primes(10000)
# Sys.time() - t1
# system.time(primes(10000))