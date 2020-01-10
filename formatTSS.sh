# $1 is interested region in bed format, $2 is the genome coverage file (three columns chr,pos,cov)
## make a bed file from the genome coverage
awk -v "OFS=\t" '{print $1,$2,$2+1,$3}' $2 > "$2".tmp
bedtools intersect -a $1 -b "$2".tmp -wa -wb > "$2".tmp.intersect
python getMat.py "$2".tmp.intersect "$2".TSSmat.txt
rm "$2".tmp
rm "$2".tmp.intersect


