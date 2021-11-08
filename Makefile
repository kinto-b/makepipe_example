all: output/report.html

clean:
		rm -f data/*

# Obtain a large file of English words.
data/words.txt:
		Rscript -e 'download.file("https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "data/words.txt", quiet = TRUE)'

# Calculate a histogram of word lengths.
data/histogram.tsv: data_prep.R data/words.txt
		Rscript $<

# Generate a figure of this histogram.
data/histogram.png: data_viz.R data/histogram.tsv
		Rscript $<
		rm Rplots.pdf # Clean up unwanted .pdf by-product

# Render a R Markdown report in HTML.
output/report.html: report.Rmd data/histogram.png
		Rscript -e 'rmarkdown::render("$<", output_file = "$@")'
