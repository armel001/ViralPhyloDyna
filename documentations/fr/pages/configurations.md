# **Configuration**

!!! tip
    Vous pouvez modifier les paramètres par défaut dans le fichier **config.yaml** situé dans le répertoire **./config/**.

## **Ressources**
Modifiez pour correspondre à votre configuration matérielle  
- **cpus** : pour les outils qui le permettent _(ex : bwa)_, nombre maximum de cœurs CPU utilisés en parallèle _(par défaut : '8')_ [INT]
- **ram** : pour les outils qui le permettent _(ex : samtools)_, limite de mémoire en Go _(par défaut : '16' Go)_ [INT]
- **tmpdir** : pour les outils qui le permettent _(ex : pangolin)_, spécifiez où les fichiers temporaires seront créés _(par défaut : '$TMPDIR')_ [STR]

## **Consensus**
- **path** : chemin vers les génomes de référence _(par défaut : 'resources/genomes/')_ [PATH]
- **reference** : votre génome de référence au format fasta _(par défaut : 'SARS-CoV-2\_Wuhan\_MN-908947-3')_ [STR]
- **mincov** : couverture minimale, masque les régions avec une couverture inférieure par des "N" _(par défaut : '30')_ [INT] °avec LoFreq
- **minaf** : fréquence allélique minimale autorisée pour l'étape de détection des variants _(par défaut : '0.2')_ [FLOAT] °avec LoFreq
- **iupac** : sortie des variants sous forme de codes d'ambiguïté IUPAC _(par défaut : désactivé)_ [OPT] °avec LoFreq
- **aligner** : cartographie des lectures avec **bwa**, **bowtie2** ou **minimap2** _(par défaut : 'bwa')_
- **caller** : appel des SNV avec **ivar** ou **lofreq** _(par défaut : 'ivar')_

## **Nextclade**
- **path** : chemin vers les ensembles de données Nextclade _(par défaut : 'resources/nextclade/')_ [PATH]
- **dataset** : ensemble de données Nextclade : **sars-cov-2**, **MPXV**, **hMPXV** ou **hMPXV_B1**

## **Ivar**
- **max_depth** :
- **min_bq** :
- **min_qual** :
- **map_qual** :

## **LoFreq**
- **map_qual** :

## **Bamclipper**
- **path** : chemin vers les fichiers primers au format BEDPE _(par défaut : 'resources/primer/bedpe')_ [PATH]
- **primers** : ensemble de primers au format BEDPE _(par défaut : 'SARS-CoV-2_Wuhan_MN-908947-3_artic-primers-V4-1')_ [STR]
- **upstream** : _(par défaut : '5')_
- **downstream** : _(par défaut : '5')_

## **BWA**
- **path** : chemin vers les index BWA _(par défaut : 'resources/indexes/bwa/')_ [PATH]
- **algorithm** : algorithme pour construire un index BWA _(par défaut : désactivé)_

## **Bowtie2**
- **path** : chemin vers les index Bowtie2 _(par défaut : 'resources/indexes/bowtie2/')_
- **algorithm** : algorithme pour construire un index Bowtie2 _(par défaut : désactivé)_
- **sensitivity** : paramètre Bowtie2 pour la sensibilité _(par défaut : '--sensitive')_

## **Minimap2**
- **path** : chemin vers les index Minimap2 _(par défaut : 'resources/indexes/minimap2/')_
- **algorithm** : algorithme pour construire un index Minimap2 :
  - **k-mer_size** : -k : taille des k-mers _(par défaut : '21', maximum '28')_ [INT]
  - **minimizer_size** : -w : taille de la fenêtre du minimiseur _(par défaut : '11')_ [INT]
  - **split_size** : -I : division des index par {NUM} bases _(par défaut : '8G')_ [INT]
  - **homopolymer** : -H : utilise les k-mers compressés par homopolymères _(par défaut : non)_
- **preset** : paramètres prédéfinis Minimap2 (toujours appliqués avant d'autres options) :
  - **sr** :
  - **map-ont** :
  - **ava-ont** :
  - **splice** :
  - **map-pb** :
  - **map-hifi** :
  - **ava-pb** :
  - **splice:hq** :
  - **asm5** :
  - **asm10** :
  - **asm20** :

## **Sickle-trim**
- **quality** : [Score Q-phred](https://en.wikipedia.org/wiki/Phred_quality_score) minimum _(par défaut : '30')_ [INT]
- **length** : longueur minimale des lectures après le rognage _(par défaut : '50')_ [INT]
- **command** : exécute le pipeline pour des lectures en paire _(par défaut et recommandé : 'pe')_
- **encoding** : pour les données récentes d'Illumina, utilisez 'sanger' _(par défaut et recommandé : 'sanger')_

## **Cutadapt**
- **length** : exclut les lectures plus courtes que cette longueur après le rognage _(par défaut : '50')_ [INT]
- **kits** : séquence d'un adaptateur ligaturé à l'extrémité 3' de la première lecture _(par défaut : kits Illumina 'truseq', 'nextera' et 'small')_

## **Fastq-Screen**
- **config** : chemin vers le fichier de configuration Fastq-Screen _(par défaut : 'configuration/fastq-screen/' [*])_
- **subset** : crée un sous-ensemble temporaire du fichier de séquences avec ce nombre de lectures spécifié _(par défaut : '1000')_

### [*] configuration/fastq-screen/{aligner}.conf
- **DATABASE** : décommentez (#) ou ajoutez vos propres 'DATABASE' pour configurer plusieurs dépistages génomiques.

## **GisAid (à faire)**
- **username** :
- **threshold** :
- **name** :
- **country** :
- **identifier** :
- **year** :

## **Environnements**
- **frontend** : interface conda, **mamba** ou **conda** _(par défaut : 'mamba')_
- **yaml*** : chemins/noms/versions des environnements conda _(par défaut : workflow/environments/{tools}_v.{version}.yaml)_

!!! note
    Modifiez uniquement si vous souhaitez changer certains environnements (ex : tester une nouvelle version ou revenir à une ancienne).
