citation()

# set the working directory
#setwd("~/projects/ncbiGenomeList")

# Loading Data into R
d <- read.delim("data/plasmids.txt", stringsAsFactors=FALSE, na.strings="-", check.names=FALSE)

cat("# Exploring Dataframes\n")
dim(d)
head(d, n=2)
colnames(d)

cat("# Data Summary\n")
summary(d)

# Exploring Data Visually
pdf(file="analysis/plot.pdf")
par(mfcol=c(2,2))
x <- "Size (Kb)"
y <- "GC%"
hist(d[,y], xlab = y, main = "Histogram")
plot(d[,x], d[,y], xlab = x, ylab = y)
g <- "Kingdom"
barplot(table(d[,g]))
boxplot(d[,y] ~ d[,g], ylab = y)
dev.off()

# Exporting Data
write.csv(table(d$Group, d$Kingdom), file="analysis/table.csv")

# Print R version and packages
sessionInfo()
