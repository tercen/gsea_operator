# Gene Set Enrichment and Over-Representation Analysis operator

##### Description

This operator performs a Gene Set Enrichment Analysis (GSEA) or an Over-Representation Analysis (ORA).

##### Usage

Input projection|. 
---|---
`y-axis`     | numeric, measurement (e.g. normalized gene expression value) 
`row`        | factor, gene set
`col`        | factor, gene name

Properties|. 
---|---
`min_size`     | numeric, minimal size of a gene set to be considered in the analysis (default: 10)
`max_size`     | numeric, maximal size of a gene set to be considered in the analysis (default: 500)
`seed`     | numeric, random seed (default is 42 and will be ignored if <= 0)
`method` | string, the analysis method to perform (`GSEA` or `ORA`, default: `GSEA`)
`n_permutations` | numeric, for ORA, the number of permutations to perform to estimate the p-value (default: 1000)

Output relations|. 
---|---
`pval`        | numeric, p-value of the test
`padj`        | numeric, adjusted p-value of the test
`ES`        | numeric, enrichment score (GSEA only)
`NES`        | numeric, normalised enrichment score (GSEA only)

##### References

This operator is a wrapper of the `fgsea` and `fora` functions from the `fgsea` [R/Bioconductor package](http://bioconductor.org/packages/release/bioc/html/fgsea.html).

See [GSEA on Wikipedia](https://en.wikipedia.org/wiki/Gene_set_enrichment_analysis).

##### See Also

[read_gmt_operator](https://github.com/tercen/read_gmt_operator)
