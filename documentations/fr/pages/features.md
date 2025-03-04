# **Fonctionnalités et outils**

## **Gestionnaire de pipeline**
  - Workflow : Snakemake
  - Environnements : Miniforge _(Conda)_
  
## **Qualité contrôle des lectures**
  - Contrôle des contaminations : Fastq-Screen	
  - Mesures qualités des lectures : FastQC
  - Rapport qualité HTML : MultiQC
  
## **Nettoyage des lectures**
  - Nettoyage des adaptateurs Illumina : Cutadapt
  - Nettoyage des primers d'amplicons : Cutadapt _('hard-clipping')_
  - Nettoyage des lectures basses qualités : Sickle-trim
  
## **Alignement des lectures**
  - Indexation des genomes : BWA _(ou minimap2, ou bowtie2)_
  - Allignement des lectures : BWA _(ou minimap2, ou bowtie2)_
  - Nettoyage des primers d'amplicons : Bamclipper _('soft-clipping')_
  - Visualisation _(avec IGV)_ : fichiers BAM, BAI et BED
  - Rapport de couverture génomique : Bedtools _(tableur)_
  
## **Appel de variants**
  - Filtrage des variants : Ivar
  - Appel de variants : Ivar
  
## **Sequences consensus**
  - Appel du consensus : Ivar _(fichier FASTA)_
  
## **Classification génomiques**
  - Qualité des génomes SARS-CoV-2 : Nextclade
  - Assignation lignées Nextclade : Nextclade
  - Assignation lignées Pangolin : Nextclade _(ou Pangolin)_
  
## Rulegraph
<img src="../../../images/gevarli_rulegraph.png" width="2043" height="3216">

## Filegraph 
<img src="../../../images/gevarli_filegraph.png" width="2043" height="3882">
