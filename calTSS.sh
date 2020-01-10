# $1 is the TSS matrix file, $2 is the length of flank region from the ends of the 2000 bp window, $3 is the size of flank region around the TSS to detect the largest value, and $4 is the smooth parameter.
# output the TSS score
Rscript --vanilla calTSSscore.r $1 $2 $3 $4


