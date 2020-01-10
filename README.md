# TSS_enrichment_score_calculation
ATAC-seq data Transcript Start Site (TSS) enrichment score calculation

## Step1: Preparing reference files
We are using the TSS from the UCSC Refseq annotation, hg19 for example.
The procedures of this step can be found at [this nice post](https://randomstate.net/2018-06-28-getting-refseq-gene-tss-from-ucsc/).
Assuming the downloaded annotation file, *reference.txt*, is ready, which should include columns in the following order:

|bin	|name	|chrom	|strand	|txStart	|txEnd	|cdsStart	|cdsEnd	|exonCount	|exonStarts	|exonEnds	|score	|name2	|cdsStartStat	|cdsEndStat	|exonFrames|
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

Run the following command:

`./getTSS.sh reference.txt`

It generated three files *reference.txt.TSS.bed, reference.txt.TSS.unique.bed, and reference.txt.TSS.unique.2K.bed*.
Only *reference.txt.TSS.unique.2K.bed* will be used in the following steps.



