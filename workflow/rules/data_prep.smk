###############################################################################

rule fasta_concatenation:
    message: 
        """
        Concatenating query and background FASTA files and removing duplicates
        Samples : {wildcards.sample}
        """
    conda:
        SEQKIT
    input: 
        fasta_query="resources/input_dir/{sample}_Query.fasta",
        fasta_background="resources/input_dir/{sample}_Background.fasta"
    output: 
        msa="results/00_Dataset/{sample}_msa.fasta",
        msa_dedup="results/00_Dataset/{sample}_msa_rmdup.fasta"
    log:
        "results/log/{sample}_fasta_concat.log"
    shell:
        """
        cat {input.fasta_query} {input.fasta_background} > {output.msa}
        echo "The concatenated FASTA file contains $(grep '>' {output.msa} | wc -l) sequences." >> {log}
        seqkit rmdup -s -i -o {output.msa_dedup} {output.msa}
        echo "After removing duplicates, the file contains $(grep '>' {output.msa_dedup} | wc -l) sequences." >> {log}
        2>> {log}
        """
    
###############################################################################

rule metadata_concatenation:
    message:
        """
        Concatenating query and background metadata files
        Samples : {wildcards.sample}
        """
    input: 
        metadata_query="resources/input_dir/{sample}_Query.metadata.tsv",
        metadata_background="resources/input_dir/{sample}_Background.metadata.tsv"
    output: 
        metadata="results/00_Dataset/{sample}_metadata.tsv"
    log:
        "results/log/{sample}_metadata_concat.log"
    run:
        import pandas as pd

        with open(log[0], "w") as logfile:
            try:
                query = pd.read_csv(input.metadata_query, sep='\t', dtype=str)
                background = pd.read_csv(input.metadata_background, sep='\t', dtype=str)

                # Check if the columns are the same
                if list(query.columns) != list(background.columns):
                    raise ValueError("The columns of the query and background metadata files do not match.")

                # Concatenate the dataframes
                combined = pd.concat([query, background], ignore_index=True)

                # Save the combined dataframe to the output file
                combined.to_csv(output.metadata, sep='\t', index=False)

                logfile.write(f"Metadata concatenation successful for sample: {wildcards.sample}\n")
                logfile.write(f"Total records: {len(combined)}\n")

            except Exception as e:
                logfile.write(f"ERROR during metadata concatenation for {wildcards.sample}:\n{str(e)}\n")
                raise