# -----------------------
# Last Update: 2016-1-29
# -----------------------

citation()

# set the working directory
#setwd("~/projects/ncbiGenomeList")

# Loading Data into R
# d <- read.delim("data/prokaryotes.txt", stringsAsFactors=FALSE, na.strings="-", check.names=FALSE)
# d <- read.delim("data/output_proteobacteria.txt", stringsAsFactors=FALSE, na.strings="-", check.names=FALSE)
# d <- read.delim("data/output_firmicutes.txt", stringsAsFactors=FALSE, na.strings="-", check.names=FALSE)
#d <- read.delim("data/output_actinobacteria.txt", stringsAsFactors=FALSE, na.strings="-", check.names=FALSE)

# cat("# Exploring Dataframes\n")
# dim(d)
# head(d, n=2)
# colnames(d)

# cat("# Data Summary\n")
# summary(d)

# Exploring Data Visually
# pdf(file="../BImyproject/analysis/GCcheckoutput.pdf")
pdf(file="GCcheckoutput.pdf")
d <- read.delim("../../data/prokaryotes.txt", stringsAsFactors=FALSE, na.strings="-", check.names=FALSE)
x <- "GC%"; d <- d[!is.na(d[,x]),]
g <- "Group"; sort(table(d[,g]))
g <- "SubGroup"; sort(table(d[,g]))
groups <- names(head(sort(table(d[,g]), decreasing=TRUE), n=3))
par(mfcol=c(3,1))
for( group in groups){
TF <- d[,g] == group; n <- sum(TF); hist(d[TF, x], xlab = x, xlim = range(d[,x]), main = paste(group,"; n =",n,"; median =",median(d[TF, x])) )
}

# par(mfcol=c(2,2))
# x <- "Size (Mb)"
# y <- "GC%"
# hist(d[,y], xlab = y, main = "Histogram")
# plot(d[,x], d[,y], xlab = x, ylab = y)
# g <- "Kingdom"
# barplot(table(d[,g]))
# boxplot(d[,y] ~ d[,g], ylab = y)
dev.off()

# Exporting Data
# write.csv(table(d$Group, d$Kingdom), file="analysis/table.csv")

# Print R version and packages
sessionInfo()
