## Main build rule

all: plot_Antwerp.pdf plot_all.pdf

## Sub build rules 

listings.csv reviews.csv: download.R
	R --vanilla < download.R
	
aggregated_df.csv: clean.R listings.csv reviews.csv
	R --vanilla < clean.R
	
pivot_table.csv: pivot_table.R aggregated_df.csv
	R --vanilla < pivot_table.R
	
plot_Antwerp.pdf: plot_antwerp.R pivot_table.csv
	R --vanilla < plot_antwerp.R
	
plot_all.pdf: plot_all.R aggregated_df.csv
	R --vanilla < plot_all.R

