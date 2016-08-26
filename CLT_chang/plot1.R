set.seed(1)
set10 <- NULL
set10 <- sapply(1:10, function(x) mean(rexp(40,0.2)))

png(filename = "plot1.png")

hist(set10, main = "Distribution of 10 Averages", xlab = "Averages", freq = FALSE, xlim = c(3,7))

curve(dnorm(x, mean=5, sd=sqrt(0.625)), add = TRUE, col="green", lwd = 4)
curve(dnorm(x, mean=mean(set10), sd=sd(set10)), add = TRUE, col="black", lwd = 2)
lines(density(set10), col="red", lwd = 2)

dev.off()

