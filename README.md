### ABOUT

#### Pipeline for Viral Phylogenetic and Phylodynamic Analysis

A Snakemake-based pipeline for viral phylogenetic, phylodynamic, and import/export analysis, developed as part of the AFROSCREEN initiative. It supports large-scale phylogenetic tree reconstruction, migration analysis, and the extraction of importation/exportation events using time-scaled trees.

#### Authors:

- **Thibaut Armel Chérif GNIMADI** – *CERFIG, Guinea*  
- **Nicolas FERNANDEZ NUÑEZ** – *IRD, France*

---

## Installation

Before you begin, make sure the following are installed:

- [Snakemake ≥ 7.0](https://snakemake.readthedocs.io/en/stable/)
- [Conda (Miniconda or Anaconda)](https://docs.conda.io/en/latest/)

Then, clone the repository:

```bash
git clone https://github.com/armel001/ViralPhyloDyna.git
cd ViralPhyloDyna
```

Create and activate the environment:

```bash
conda env create -f envs/environment.yaml
conda activate viralphylodyna
```

You may also want to install Snakemake globally:

```bash
conda install -c bioconda snakemake
```

---

##  Usage

Make sure to configure your input files "fasta and metadata" correctly. 
*Example : alpha_Background.fasta and alpha_Background.metadata.tsv*

The main input files are:
- `resources/input_dir/`: folder containing viral sequence alignments (FASTA format) and metadata in tsv format           
            
        *Example : `resources/input_dir/alpha_Background.fasta` and `alpha_Background.metadata.tsv`*


You can run the pipeline using the following command:
```bash
snakemake --cores 4
```

### Example command for a dry run:
```bash
snakemake -n
```

---

##  Update

To update the pipeline to the latest version:
```bash
cd ViralPhyloDyna
git pull origin main
```

If changes are made to the environment:
```bash
conda env update --file envs/environment.yaml --prune
```

---

##  Reference

### Tools Used

- **Snakemake**: Workflow management system to create reproducible and scalable data analyses.  
  Köster J, Rahmann S. (2012). *Snakemake – a scalable bioinformatics workflow engine*. Bioinformatics.

- **Nextalign**: Tool for multiple sequence alignment optimized for viral genomes.  
  Part of the Nextstrain toolkit. See: https://docs.nextstrain.org/projects/nextclade/en/stable/user/nextalign-cli.html

- **Gblocks**: Eliminates poorly aligned positions and divergent regions of a DNA or protein alignment.  
  Castresana J. (2000). *Selection of conserved blocks from multiple alignments for their use in phylogenetic analysis*. Mol Biol Evol.

- **IQ-TREE 2**: Efficient phylogenomic software for maximum-likelihood phylogeny inference.  
  Minh BQ et al. (2020). *IQ-TREE 2: New Models and Efficient Methods for Phylogenetic Inference in the Genomic Era*. Mol Biol Evol.

- **SeqKit**: Fast and versatile toolkit for FASTA/Q file manipulation.  
  Shen W et al. (2016). *SeqKit: A cross-platform and ultrafast toolkit for FASTA/Q file manipulation*. PLoS ONE.

- **TreeTime**: Phylodynamic analysis and time-scaled tree reconstruction.  
  Sagulenko P, Puller V, Neher RA. (2018). *TreeTime: Maximum-likelihood phylodynamic analysis*. Virus Evolution.

- **Baltic**: Visualization tool for time-scaled phylogenetic trees.  
  Part of the Nextstrain visualization toolkit (see: https://github.com/evogytis/baltic)


---

##  Acknowledgements

This pipeline was developed with support from **CERFIG**, **IRD**, and the **AFROSCREEN** project.

---

##  Contact

For questions, issues or contributions, please contact:  
**Thibaut Armel Chérif Gnimadi**  
📧 armel.gnimadi@cerfig.org  
