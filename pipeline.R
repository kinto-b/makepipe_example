library(makepipe)

# Obtain a large file of English words -----------------------------------------
if (!file.exists("data/words.txt")) {
  download.file(
    "https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", 
    destfile = "data/words.txt", 
    quiet = TRUE
  )
}

# Calculate a histogram of word lengths ----------------------------------------
res <- makepipe::make_with_source(
	source = "data_prep.R",
	targets = "data/histogram.tsv",
	dependencies = "data/words.txt"
)

res # Print execution meta-data 
if (res$executed) {
  # Check that the `hist_dat` object registered in `data_prep.R` is a table
  stopifnot(is.table(res$result$hist_dat)) 
}

# Generate a figure of this histogram ------------------------------------------
makepipe::make_with_source(
	source = "data_viz.R",
	targets = "data/histogram.png",
	dependencies = "data/histogram.tsv"
)

if (file.exists("Rplots.pdf")) {
  file.remove("Rplots.pdf") # Clean up unwanted .pdf by-product
}

# Render a R Markdown report in HTML -------------------------------------------
makepipe::make_with_recipe(
	recipe = rmarkdown::render(
		"report.Rmd",
		output_file = "output/report.html"
	),
	targets = "output/report.html",
	dependencies = c("report.Rmd", "data/histogram.png")
)

# Display pipeline visualisation -----------------------------------------------
makepipe::show_pipeline(
  tooltips = c(
    data_prep.R = "Calculate a histogram of word lengths",
    data_viz.R = "Generate a figure of this histogram",
    report.Rmd = "Render a R Markdown report in HTML"
  )
)
