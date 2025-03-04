# **Configuration**

!!! tip
   You can edit default settings in **config.yaml** file into **./config/** directory.


## **Resources**
Edit to match your hardware configuration  
- **cpus**: for tools that can _(i.e. bwa)_, could be use at most n cpus to run in parallel _(default: '8')_ [INT]
- **ram**: for tools that can _(i.e. samtools)_, limit memory usage to max n Gb _(default: '16' Gb)_ [INT]
- **tmpdir**: for tools that can _(i.e. pangolin)_, specify where you want the temp stuff _(default: '$TMPDIR')_

## **Consensus**
- **path**: path to genomes references _(default: 'resources/genomes/')_ [PATH]
- **reference**: your reference, in fasta format _(default: 'SARS-CoV-2\_Wuhan\_MN-908947-3')_ [STR]
- **mincov**: minimum coverage, mask lower regions with "N" _(default: '30')_ [INT] °with LoFreq 
- **minaf**: minimum allele frequency allowed for variant calling step _(default: '0.2')_ [FLOAT] °with LoFreq
- **iupac**: output variants in the form of IUPAC ambiguity codes _(default: deactivate)_ [OPT] °with LoFreq
- **aligner**: map reads using either **bwa**, **bowtie2** or **minimap2** _(default: 'bwa')_
- **caller**: call SNV using either **ivar** or **lofreq** _(default: 'ivar')_ 

## **Nextclade**
- **path**: path to nextclade datasets _(default: 'resources/nextclade/')_ [PATH]
- **dataset**: Nextclade dataset : **sars-cov-2** , **MPXV**, **hMPXV** or **hMPXV_B1**

## **Ivar**
- **max_depth**:
- **min_bq**:
- **min_qual**:
- **map_qual**:

## **LoFreq**
- **map_qual**:

## **Bamclipper**
- **path**: path to primers bedpe files _(default 'resources/primer/bedpe')_ [PATH]
- **primers**: primer set, in BEDPE format _(default: 'SARS-CoV-2_Wuhan_MN-908947-3_artic-primers-V4-1')_ [STR]
- **upstream**: _(default: '5')_
- **downstream**: _(default: '5')_

## **BWA**
- **path**: path to BWA indexes _(default: 'resources/indexes/bwa/')_ [PATH]
- **algorithm**: algorithm for constructing BWA index _(default: deactivate)_

## **Bowtie2**
- **path**: path to Bowtie2 indexes (default: 'resources/indexes/bowtie2/')
- **algorithm**: algorithm for constructing Bowtie2 index _(default: deactivate)_ 
- **sensitivity**: preset for bowtie2 sensitivity _(default: '--sensitive')_

## **Minimap2**
- **path**: path to Minimap2 indexes (default: 'resources/indexes/minimap2/')
- **algorithm**: algorithm for constructing Minimap2 index:
  - **k-mer_size**: -k: k-mer size _(default: '21', no larger than '28')_ [INT] 
  - **minimizer_size**: -w: minimizer window size _(default: '11')_ [INT]
  - **split_size**: -I: split index for every {NUM} input bases _(default: '8G')_ [INT] 
  - **homopolymer**: -H: use homopolymer-compressed k-mer _(default: no)_ 
- **preset**: Minimap2 presets (always applied before other options)
  - **sr**:
  - **map-ont**:
  - **ava-ont**:
  - **splice**:
  - **map-pb**:
  - **map-hifi**:
  - **ava-pb**:
  - **splice:hq**:
  - **asm5**:
  - **asm10**:
  - **asm20**:

## **Sickle-trim**
- **quality**: [Q-phred score](https://en.wikipedia.org/wiki/Phred_quality_score) limit _(default: '30')_ [INT]
- **length**: read length limit, after trimming _(default: '50')_ [INT]
- **command**: Pipeline wait for paired-end reads _(default and should be: 'pe')_
- **encoding**: If your data are from recent Illumina run, let 'sanger' _(default and should be: 'sanger')_

## **Cutadapt**
- **length**: discard reads shorter than length, after trimming _(default: '50')_ [INT]
- **kits**: sequence of an adapter ligated to the 3' end of the first read _(default: 'truseq', 'nextera' and 'small' Illumina kits)  

## **Fastq-Screen**
- **config**: path to the fastq-screen configuration file _(default: 'configuration/fastq-screen/' [*] )_
- **subset**: do not use the whole sequence file, but create a temporary dataset of this specified number of read _(default: '1000')_

### [*] configuration/fastq-screen/{aligner}.conf
- **DATABASE**: (de)comment (#) or add your own 'DATABASE' to configure multiple genomes screaning

## **GisAid (todo)**
- **username**:
- **threshold**:
- **name**:
- **country**:
- **identifier**:
- **year**:

## **Environments**
- **frontend**: conda frontend, **manba** or **conda** _(default: 'mamba')_
- **yaml***: conda environments paths/names/version (default: workflow/environments/{tools}\_v.{version}.yaml)

!!! note
   Edit only if you want to change some environments (e.g. test a new version or back to an older version)
