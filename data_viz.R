library(ggplot2)
qplot(Length, Freq, data = read.delim("data/histogram.tsv"))
ggsave("data/histogram.png")
