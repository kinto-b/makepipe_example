words <- readLines("data/words.txt")
Length <- nchar(words)
hist_dat <- table(Length)

# Register value for inspection at pipeline level
makepipe::make_register(hist_dat, 'hist_dat') 

write.table(hist_dat, "data/histogram.tsv",
						sep = "\t", row.names = FALSE, quote = FALSE)
