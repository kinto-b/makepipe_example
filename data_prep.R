# Header for `make_with_dir` (n.b. not necessary for `make_with_source`)
#' @description Generate a figure of this histogram
#' @targets "data/histogram.png"
#' @dependencies "data/histogram.tsv"
#' @makepipe

words <- readLines("data/words.txt")
Length <- nchar(words)
hist_dat <- table(Length)

# Register value for inspection at pipeline level
makepipe::make_register(hist_dat, 'hist_dat') 

write.table(hist_dat, "data/histogram.tsv",
						sep = "\t", row.names = FALSE, quote = FALSE)
