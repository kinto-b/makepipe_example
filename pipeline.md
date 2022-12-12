# Pipeline

## data_viz.R

Calculate a histogram of word lengths

* Source: './data_viz.R'
* Targets: 'data/histogram.tsv'
* File dependencies: 'data/words.txt'
* Executed: TRUE
* Execution time: 1.784743 secs
* Result: 0 object(s)
* Environment: 0x0000021ba52011e0

## data_prep.R

Generate a figure of this histogram

* Source: './data_prep.R'
* Targets: 'data/histogram.png'
* File dependencies: 'data/histogram.tsv'
* Executed: FALSE
* Environment: 0x0000021ba52011e0

## Recipe

Render a R Markdown report in HTML

* Recipe: 

rmarkdown::render("report.Rmd", output_file = "output/report.html")

* Targets: 'output/report.html'
* File dependencies: 'report.Rmd', 'data/histogram.png'
* Executed: TRUE
* Execution time: 2.090765 secs
* Result: 1 object(s)
* Environment: 0x0000021ba29171f8

