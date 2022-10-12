##Creating variables 
TEMP = ../../temp 
OUPUT = ../../output
DATA = ../../data

## Main build rule

all: $(OUTUT)/plot_Antwerp.pdf $(OUTPUT)/plot_all.pdf

## Sub build rules 

$(DATA)/listings.csv $(DATA)/reviews.csv: src/download.R
	R --vanilla < src/download.R
	
$(TEMP)/aggregated_df.csv: src/clean_data.R $(DATA)/listings.csv $(DATA)/reviews.csv
	R --vanilla < src/clean_data.R
	
$(TEMP)/pivot_table.csv: src/pivot_table.R $(TEMP)/aggregated_df.csv
	R --vanilla < src/pivot_table.R
	
$(OUTPUT)/plot_Antwerp.pdf: src/plot_antwerp.R $(TEMP)/pivot_table.csv
	R --vanilla < src/plot_antwerp.R
	
$(OUTPUT)/plot_all.pdf: src/plot_all.R $(TEMP)/aggregated_df.csv
	R --vanilla < src/plot_all.R

