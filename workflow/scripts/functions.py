# Imports
import sys
import pandas as pd
from datetime import datetime
from snakemake.io import expand

# Functions

# get_msa_input
def get_msa_input(wildcards):
    msa = "results/01_Alignment/{sample}_aligned_trimmed.fasta"
    if MODULES["subsampling"]:
        msa = "results/01_Alignment/{sample}_aligned_trimmed_subsampled.fasta"
    return msa


# GET_FINAL_OUTPUTS
def get_final_outputs():
    final_outputs = []
    # phylogeny
    if MODULES["phylogeny"]:
        final_outputs.append(expand("results/02_Phylogenetic_tree/{sample}_tree/{sample}_aligned_trimmed.fasta.treefile",
                                    sample = SAMPLES))
    # phylodynamie
    if MODULES["phylodynamie"]:
        final_outputs.append(expand("results/99_FINAL_REPORT/{sample}_annottated_tree_events.csv",
                                    sample = SAMPLES))
     # report
    if MODULES["report"]:
        final_outputs.append(expand("results/99_FINAL_REPORT/{sample}_root_to_tip_regression.pdf",
                                    sample = SAMPLES))       
    return final_outputs

def date_to_decimal(date_obj):
    year = date_obj.year
    start_year = datetime(year, 1, 1)
    end_year = datetime(year + 1, 1, 1)
    # Calcule la fraction d'année écoulée
    fraction = (date_obj - start_year).total_seconds() / (end_year - start_year).total_seconds()
    return year + fraction

def get_absolute_time(tsv_file):
    # Lit le fichier TSV
    try:
        df = pd.read_csv(tsv_file, sep="\t")
    except Exception as e:
        sys.exit(f"Erreur lors de la lecture du fichier TSV: {e}")


     # Conversion de la colonne 'date' en datetime en gérant les formats mixtes
    try:
       #df['date'] = pd.to_datetime(df['date'], format='mixed')
       df['date'] = pd.to_datetime(df['date'], infer_datetime_format=True)
    except Exception as e:
        sys.exit(f"Erreur lors de la conversion de la colonne 'date' : {e}")
        if len(sys.argv) != 2:
            sys.exit("Usage : python script.py <fichier.tsv>")
   
    # Récupère la date la plus récente
    latest_date = df['date'].max()

    # Convertit la date en format décimal
    decimal_date = date_to_decimal(latest_date)

    # Affiche le résultat au format décimal avec une décimale
    return(float(f"{decimal_date:.1f}"))