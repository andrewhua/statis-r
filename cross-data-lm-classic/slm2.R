source("slm.R")

# qq
png(filename="data/output/cofreewy_qq.png")
qqnorm(step_lm$res); qqline(step_lm$res)
dev.off()

# it is difficult to say the res is norm distribution
# so let us look at the plot of x or pair of x.

png(filename="data/output/cofreewy_plot.png")
plot(cofreewy_data) # or pairs(x)
dev.off()