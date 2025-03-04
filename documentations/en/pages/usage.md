# **Usage**

## **Quick start**

To start your first analysis:

1. Copy your **paired-end** reads files, in **.fastq.gz** format, into: **./resources/reads/** directory

!!! note
   Without reads, SARS-CoV-2 from ```./resources/test\_data/``` directory will be used

2. Execute **Run_GeVarLi.sh** bash script to run GeVarLi pipeline:
    - or with a **Double-click** on it _(if you make .sh files executable files with Terminal.app)_
	- or with a **Right-click** > **Open with** > **Terminal.app**
	- or with **CLI** from a terminal:

!!! shell
    _Exemple script to rin GeVarLi_
    ```shell
    ./Run_GeVarLi.sh
    ```

!!! warning
   If your reads were generated with an **amplicon protocol**, you will also need to provide the **amplicon primer coordinates** in **BEDPE** format, so the **primers are trimmed appropriately** using **bamclipper**.

!!! tip
   If you don't know the amplicon primer coordinates or don't have coordinates in **BEDPE** format, you can use **cutadapt** to hard-trim the first N nucleotides of your reads (N = yours amplicon primers length). 

3. Yours analyzes will start, with default configuration settings  

!!! note
   Edit **config.yaml** file in ```./configuration/``` directory.  
   Edit **fastq-screen.conf** file in```./configuration/``` directory.

## **Files tree**

```shell
🧩 GeVarLi/
│
├── 🖥️️ Run_GeVarLi.sh
├── 📜 Snakefile
├── 📚 README.md
├── 📚 CODE_OF_CONDUCT.md
├── 🪪 LICENSE.txt
├── 🚫 .gitignore
├── 📂 .git/
├── 📂 .snakemake/
│
├── 📂 configuration/
│   │
│   ├── ⚙️ config.yaml
│   ├── ⚙️ fastq-screen.conf
│   └── ⚙️ multiqc.yaml
│
│
├── 📂 workflow/
│   │
│   ├── 📂 environments/
│   │   │
│   │   ├── 🍜 {TOOL}_v.{VERSION}.yaml
│   │   └── 🍜 workflow-base_v.{VERSION}.yaml
│   │
│   └── 📂 snakefiles/
│       │
│       ├── 📜 gevarli.smk
│       └── 📜 indexing_genomes.smk
│
├── 📂 resources/
│   │
│   ├── 📂 genomes/
│   │   │
│   │   ├── 🧬 SARS-CoV-2_Wuhan_MN-908947-3.fasta
│   │   ├── 🧬 Monkeypox-virus_Zaire_AF-380138-1.fasta
│   │   ├── 🧬 {REFERENCE}.fasta
│   │   ├── 🧬 QC_Phi-X174_Coliphage_NC-001422-1.fasta
│   │   └── 🧬 QC_{REFERENCE}.fasta
│   │
│   ├── 📂 indexes/
│   │   │
│   │   ├── 📂 minimap2/
│   │   │   │
│   │   │   └── 🗂️ {GENOME}.mmi
│   │   │
│   │   ├── 📂 bwa/
│   │   │   │
│   │   │   ├── 🗂️ {GENOME}.amb
│   │   │   ├── 🗂️ {GENOME}.ann
│   │   │   ├── 🗂️ {GENOME}.bwt
│   │   │   ├── 🗂️ {GENOME}.pac
│   │   │   └── 🗂️ {GENOME}.sa
│   │   │
│   │   └── 📂 bowtie2/
│   │       │
│   │       ├── 🗂️ {GENOME}.1.bt2
│   │       ├── 🗂️ {GENOME}.2.bt2
│   │       ├── 🗂️ {GENOME}.3.bt2
│   │       ├── 🗂️ {GENOME}.4.bt2
│   │       ├── 🗂️ {GENOME}.rev.1.bt2
│   │       └── 🗂️ {GENOME}.rev.2.bt2
│   │
│   ├── 📂 nextclade/
│   │   │
│   │   └── 📂 {DATABASE}/
│   │       │
│   │       ├── 🌍 genemap.gff
│   │       ├── 🧪 primers.csv
│   │       ├── ✅ qc.json
│   │       ├── 🦠 reference.fasta
│   │       ├── 🧬 sequences.fasta
│   │       ├── 🏷️ tag.json
│   │       └── 🌳 tree.json
│   │
│   ├── 📂 reads/
│   │   │
│   │   ├── 🛡️ .gitkeep
│   │   ├── 📦 {SAMPLE}_R1.fastq.gz
│   │   └── 📦 {SAMPLE}_R2.fastq.gz
│   │
│   ├── 📂 primers/
│   │   │
│   │   ├── 📂 bedpe/
│   │   ├── 📂 bed/
│   │   └── 📂 fasta/
│   │
│   ├── 📂 annotations/
│   │   │
│   │   ├──  SARS-CoV-2_Wuhan_MN-908947-3.bed
│   │   └──  SARS-CoV-2_Wuhan_MN-908947-3.gff3
│   │
│   └── 📂 data_test/
│       │
│       ├── 🛡️ .gitkeep
│       ├── 📦 SARS-CoV-2_Omicron-BA1_Covid-Seq-Lib-on-MiSeq_250000-reads_R1.fastq.gz
│       └── 📦 SARS-CoV-2_Omicron-BA1_Covid-Seq-Lib-on-MiSeq_250000-reads_R2.fastq.gz
│
└── 📂 documentation/
    │
    ├── ⚙️ mkdocs.yaml
    ├── 🌐 extra.css
    │
    ├── 📂 images/
    │   │
    │   ├── 📈 afroscreen.jpeg
    │   ├── 📈 download_button.png
    │   ├── 📈 GeVarLi_by_DALL-E_icone.png
    │   ├── 📈 gevarli_filegraph.png
    │   └── 📈 gevarli_rulegraph.png
    │
    ├── 📂 en/
    │   │
    │   ├── 📚 index.md
    │   │
    │   └── 📂 pages/
    │       │
    │       ├── 📚 acknowledgedments.md
    │       ├── 📚 afroscreen
    │       ├── 📚 configurations.md
    │       ├── 📚 contributions.md
    │       ├── 📚 features.md
    │       ├── 📚 glossary.md
    │       ├── 📚 installations.md
    │       ├── 📚 references.md
    │       ├── 📚 results.md
    │       └── 📚 usage.md
    │
    └── 📂 fr/
        │
        ├── 📚 index.md
        │
        └── 📂 pages/
            │
            ├── 📚 acknowledgedments.md
            ├── 📚 afroscreen
            ├── 📚 configurations.md
            ├── 📚 contributions.md
            ├── 📚 features.md
            ├── 📚 glossary.md
            ├── 📚 installations.md
            ├── 📚 references.md
            ├── 📚 results.md
            └── 📚 usage.md
```
