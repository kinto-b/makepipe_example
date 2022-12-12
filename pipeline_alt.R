#
# A pipeline built using `make_with_dir`. This relies on the roxygen headers in 
# the sourced scripts
#

library(makepipe)

# Construct a pipeline using the scripts in the current directory
make_with_dir() 

# Add further blocks as necessary
makepipe::make_with_recipe(
  note = "Render a R Markdown report in HTML",
  recipe = rmarkdown::render(
    "report.Rmd",
    output_file = "output/report.html"
  ),
  targets = "output/report.html",
  dependencies = c("report.Rmd", "data/histogram.png")
)

# Save a plain text summary of the pipeline
save_pipeline(file = "pipeline.md",as="text")

