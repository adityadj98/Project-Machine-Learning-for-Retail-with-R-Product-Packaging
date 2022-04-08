library(arules)
data <- read.transactions(file="transaksi_dqlab_retail.tsv", format="single", sep="\t", cols=c(1,2), skip=1)
kombinasi <- apriori(data, parameter=list(supp=10/length(data), conf=0.1, target="rules", minlen=2, maxlen=3))
ra <-subset(kombinasi, rhs %in% "Tas Makeup")
rb <-subset(kombinasi, rhs %in% "Baju Renang Pria Anak-anak")
ra <- sort(ra, by="lift", decreasing=TRUE)[1:3]
rb <- sort(rb, by="lift", decreasing=TRUE)[1:3]
rules <- c(ra, rb)
inspect(rules)
write(rules, file="kombinasi_retail_slow_moving.txt")