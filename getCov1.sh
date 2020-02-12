# $1 is a bam file, $2 is the bed file of interesting regions.
# output the coverage per base in the regions
bedtools intersect -a $1 -b $2 -ubam -wa -u > "$1".sel.bam
