#using R to plot for latency
data <- read.table("list.txt")
png(file = "latency_norm.png")
j <- data$V1
print(mean(data$V1))
k <- dnorm(j, mean = mean(data$V1), sd = sd(data$V1))
par(col.lab="red")
par(col.main="purple")
plot(j,k,main="Latency Normal Distribution Plot",xlab="Response time (seconds)",ylab="Probability")
dev.off()
