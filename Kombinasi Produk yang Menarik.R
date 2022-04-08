library(arules)
nama_file <- "https://storage.googleapis.com/dqlab-dataset/transaksi_dqlab_retail.tsv"
transaksi_tabular <- read.transactions (file=nama_file, format="single", sep="\t", cols=c(1,2), skip=1)
apriori_rules <- apriori(transaksi_tabular,
                         parameter=list(supp=10/length(transaksi_tabular), conf= 0.5, minlen=2, maxlen=3))
apriori_rules <-head(sort(apriori_rules, by='lift', decreasing=T), n=10)
inspect(apriori_rules)
write(apriori_rules, file="kombinasi_retail.txt")