# Gene Set Enrichment Analysis operator

##### Description

`gsea` operator performs a Gene Set Enrichment Analysis (GSEA).

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
`n_perm`     | numeric, number of permutations (default: 1000)

Output relations|.
---|---
`pval`        | numeric, p-value of the test
`padj`        | numeric, adjusted p-value of the test
`ES`        | numeric, enrichment score
`NES`        | numeric, normalised enrichment score

##### Details

##### References

This operator is a wrapper of the `fgsea` function from the `fgsea` [R/Bioconductor package](http://bioconductor.org/packages/release/bioc/html/fgsea.html).

See [GSEA on Wikipedia](https://en.wikipedia.org/wiki/Gene_set_enrichment_analysis).

##### See Also

[read_gmt_operator](https://github.com/tercen/read_gmt_operator)
