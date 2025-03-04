# **Features and tools**

## **Workflow management**
  - Workflow: Snakemake
  - Environments: Miniforge _(Conda)_
  
## **Reads quality control**
  - Contamination checking: Fastq-Screen
  - Reads qualities metrics: FastQC
  - HTML reporting: MultiQC
  
## **Reads cleaning**
  - Illumina adpters trimming: Cutadapt
  - Amplicon primers trimming: Cutadapt _('hard-clipping')_
  - Reads quality trimming: Sickle-trim
  
## **Reads mapping**
  - Indexing genomes: BWA _(or minimap2, or bowtie2)_
  - Reads mapping: BWA _(or minimap2, or bowtie2)_
  - Amplicon primers trimming: Bamclipper _('soft-clipping')_
  - Visualization _(with IGV)_: BAM, BAI and BED files
  - Genome coverage reports: Bedtools _(table file)_
  
## **Variants calling**
  - Variants filtering: Ivar
  - Variants calling: Ivar
  
## **Consensus sequences**
  - Consensus calling: Ivar _(FASTA file)_
  
## **Genomes classification**
  - SARS-CoV-2 genome quality: Nextclade
  - Nextclade lineages assignation: Nextclade 
  - Pangolin lineages assignation: Nextclade _(or Pangolin)_
  
## Rulegraph
<img src="../../../images/gevarli_rulegraph.png" width="2043" height="3216">

## Filegraph 
<img src="../../../images/gevarli_filegraph.png" width="2043" height="3882">
