# Integrative multiomic analysis of single-nucleotide variants identifies candidate genes for human craniofacial malformation

This repostiroy contains code for reproducing the results and figures of our study.

The preprint version of this work can be accessed through bioRxiv (DOI: [10.64898/2025.12.29.696805](https://doi.org/10.64898/2025.12.29.696805))

## Repository structure

[Preprocessing](https://github.com/jacky-mh-yam/craniofacial_genomics_notebooks/tree/a1360574dac30b6053c19a2b043b4d1aa6c7b1f3/preprocessing) contains notebooks and configs for preprocessing SNP array, ChIP-Seq, and scRNA-seq data, as well as preparation of pipeline inputs.

[Analyses](https://github.com/jacky-mh-yam/craniofacial_genomics_notebooks/tree/a1360574dac30b6053c19a2b043b4d1aa6c7b1f3/analyses) contains notebooks and configs for the main analyses. In particular:

- [Integrative pipeline](https://github.com/jacky-mh-yam/craniofacial_genomics_notebooks/tree/a1360574dac30b6053c19a2b043b4d1aa6c7b1f3/analyses/main_pipeline) developed in this study. (Workflow: SNP selection with multiomic score → classifier model training → combinatorial evaluation with mean AUROC)
- [Gene regulatory network analysis](https://github.com/jacky-mh-yam/craniofacial_genomics_notebooks/tree/a1360574dac30b6053c19a2b043b4d1aa6c7b1f3/analyses/gene_regulatory_network) on candidate disease gene using [pySCENIC](https://pyscenic.readthedocs.io/en/latest/).
- [Motif analysis](https://github.com/jacky-mh-yam/craniofacial_genomics_notebooks/tree/a1360574dac30b6053c19a2b043b4d1aa6c7b1f3/analyses/motif) on prioritized single-nucleotide variants using [motifbreakR](https://bioconductor.org/packages/release/bioc/html/motifbreakR.html).

[Plotting](https://github.com/jacky-mh-yam/craniofacial_genomics_notebooks/tree/a1360574dac30b6053c19a2b043b4d1aa6c7b1f3/preprocessing) contains notebooks for reproducing the manuscript figures.

## Datasets

All raw data used are publicly available through NCBI Gene Expression Omnibus:

| Data type  | Accession | Description   |
|-----------|-----------|---------------|
| SNP Array | [GSE69664](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE69664)      | GWAS case     |
|           | [GSE141901](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE141901)   | GWAS control  |
|           | [GSE248483](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE248483)   | GWAS control  |
|           | [GSE74100](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE74100)   | GWAS control  |
| scRNA-seq | [GSE155121](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE155121) | Embryo transcriptome |
| ChIP-Seq  | [GSE97752](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE97752)  | Embryo epigenome |
