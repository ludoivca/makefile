
## Main build rule

all: output/plot_Antwerp.pdf output/plot_all.pdf

## Sub build rules 

data/listings.csv data/reviews.csv: src/download.R
	R --vanilla < src/download.R
	
temp/aggregated_df.csv: src/clean.R data/listings.csv data/reviews.csv
	R --vanilla < src/clean.R
	
temp/pivot_table.csv: src/pivot_table.R temp/aggregated_df.csv
	R --vanilla < src/pivot_table.R
	
output/plot_Antwerp.pdf: src/plot_antwerp.R temp/pivot_table.csv
	R --vanilla < src/plot_antwerp.R
	
output/plot_all.pdf: src/plot_all.R temp/aggregated_df.csv
	R --vanilla < src/plot_all.R

