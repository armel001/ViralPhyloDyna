# **Utilisation**

## **Démarrage rapide**

Pour lancer votre première analyse :

1. Copiez vos fichiers de lectures paired-end, au format .fastq.gz, dans le répertoire ./resources/reads/.

!!! note
   Sans fichiers de lectures, les données de test SARS-CoV-2 du répertoire ```./resources/test_data/``` seront utilisées.
   
2. Exécutez le script bash Run_GeVarLi.sh pour lancer le pipeline GeVarLi :
	- soit avec un double-clic dessus (si vous avez rendu les fichiers .sh exécutables avec Terminal.app),
	- soit avec un clic droit > Ouvrir avec > Terminal.app,
	- soit avec l’interface CLI depuis un terminal :
	
!!! shell
    _Exemple de script lançant GeVarLi_
    ```shell
    ./Run_GeVarLi.sh
    ```

!!! warning
   Si vos lectures ont été générées avec un **protocole d’amplification**, vous devrez également fournir les **coordonnées des amorces d’amplification** au format **BEDPE**, afin que les **amorces soient correctement retirées** en utilisant **bamclipper**.

!!! tip 
   Si vous ne connaissez pas les coordonnées des amorces d'amplification ou si vous n'avez pas de coordonnées au format **BEDPE**, vous pouvez utiliser **cutadapt** pour retirer de force les N premiers nucléotides de vos lectures (N = longueur de vos amorces d'amplification).

3. Vos analyses démarreront avec les paramètres de configuration par défaut.

!!! note
   - Modifiez le fichier config.yaml dans le répertoire ```./configuration/```.  
   - Modifiez le fichier fastq-screen.conf dans le répertoire ```./configuration/```.
   
## **Arborescence des fichiers**

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
