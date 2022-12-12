# Header for `make_with_dir` (n.b. not necessary for `make_with_source`)
#' @description Calculate a histogram of word lengths
#' @targets "data/histogram.tsv"
#' @dependencies "data/words.txt"
#' @makepipe

library(ggplot2)
qplot(Length, Freq, data = read.delim("data/histogram.tsv"))
ggsave("data/histogram.png")
