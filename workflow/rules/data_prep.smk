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
    shell:
        """
        cat {input.metadata_query} > {output.metadata}
        tail -n +2 {input.metadata_background} >> {output.metadata}
        echo "Metadata concatenation completed for {wildcards.sample}" >> {log}
        2>> {log}
        """
        
        #"cat "                    # use this to concatenate files
        #"{input.metadata_query} " # input file
        #"-o 5 "                   # cmd optionnelle
        #"1> {output.metadata} "   # output file
        #"echo 'toto' "            # cmd optionnelle
        #"2>> {log}"               # log file