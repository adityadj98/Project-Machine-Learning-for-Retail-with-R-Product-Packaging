library(arules)
data <- read.transactions(file="https://storage.googleapis.com/dqlab-dataset/transaksi_dqlab_retail.tsv",
                          format = "single", sep = "\t", cols = c(1,2), skip =1)
bottom_10 <- sort(itemFrequency(data, type = "absolute"), decreasing = FALSE) [1:10]
hasil <- data.frame("Nama Produk" = names(bottom_10), "Jumlah" = bottom_10, row.names = NULL)
write.csv(hasil, file="bottom10_item_retail.txt")