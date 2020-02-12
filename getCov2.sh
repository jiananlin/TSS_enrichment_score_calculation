# $1 is a bam file, $2 is the bed file of interesting regions.
# output the coverage per base in the regions
bedtools genomecov -ibam "$1".sel.bam -dz | grep -v "chrM" > "$1".sel.bam.gc


