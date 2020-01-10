#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

TssEnrichmentSingleCell<- function(mat, flank = 1000,
                               endFlank = 100,
                               highest_tss_flank= 50,
                               smooth = 50 ){
        ### normlization by the endFlank local noise
        profile <- colSums(mat)
        profile_norm <- profile/mean(profile[c(1:endFlank,(flank*2-endFlank+2):(flank*2+1))])

        #smooth
        profile_norm_smooth <- zoo::rollmean(profile_norm, smooth, fill = 1)
        

        #enrichment
        max_finite <- function(x){
        suppressWarnings(max(x[is.finite(x)], na.rm=TRUE))
        }
        
        e <- max_finite(profile_norm_smooth[(flank-highest_tss_flank):(flank+highest_tss_flank)])
        return(e)
}

mat = read.delim(args[1],header=F,row.names=1,sep="\t")
endFlank = as.integer(args[2])
highest_tss_flank = as.integer(args[3])
smooth = as.integer(args[4])
print(TssEnrichmentSingleCell(mat=mat,flank = 1000,endFlank=endFlank,highest_tss_flank = highest_tss_flank,smooth=smooth))

## command line:
## Rscript --vanilla calTSSscore.r *TSSmat.txt endFlank highest_tss_flank smooth

