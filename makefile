TEMP = ../../temp
DATA = ../../data 
OUTPUT = ../../output


## Main build rule

all: plot_Antwerp.pdf plot_all.pdf

## Sub build rules 

$(DATA)/listings.csv $(DATA)reviews.csv: src/download.R
	R --vanilla < src/download.R
	
$(TEMP)/aggregated_df.csv: src/clean.R $(DATA)/listings.csv $(DATA)/reviews.csv
	R --vanilla < src/clean.R
	
$(TEMP)/pivot_table.csv: src/pivot_table.R $(TEMP)/aggregated_df.csv
	R --vanilla < src/pivot_table.R
	
$(OUPUT)/plot_Antwerp.pdf: src/plot_antwerp.R $(TEMP)/pivot_table.csv
	R --vanilla < src/plot_antwerp.R
	
$(OUPUT)/plot_all.pdf: src/plot_all.R $(TEMP)/aggregated_df.csv
	R --vanilla < src/plot_all.R

