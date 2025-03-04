###############################################################################

rule fasta_concatenation:
    # Aim: Used to concatenate query and background fasta files
    # Use: cat  
    message:
        """
        Concatenating query and background fasta files
	"""
   # params:
    input: 
        fasta_query ="resources/input_dir/{wildcard}_Query.fasta",
        fasta_background ="resources/input_dir/{wildcard}_Background.fasta"
    output: 
        msa ="results/fasta_concat/{wildcard}_msa.fasta",
      #  report ="results/fasta_concat/report_{wildcard}.txt"
    log:
        "results/log/{wildcard}_fasta_concat.log"
    shell:
        """
        cat {input.fasta_query} {input.fasta_background} > {output.msa}  
        echo "The concatenated FASTA file contains $(grep '>' {output.msa} | wc -l) sequences." >> {log}
        2> {log} # Revoir le log 
        """
    
###############################################################################

rule metadata_concatenation:
    # Aim: Used to concatenate query and background metadata files
    # Use: cat  
    message:
        """
        Concatenating query and background metadata files
	"""
   # params:
    input: 
        metadata_query ="resources/input_dir/{wildcard}_Query.metadata.tsv",
        metadata_background ="resources/input_dir/{wildcard}_Background.metadata.tsv"
    output: 
        metadata ="results/metadata_concat/{wildcard}_metadata.tsv",
      #  report ="results/fasta_concat/report_{wildcard}.txt"
    log:
        "results/log/{wildcard}_metadata_concat.log"
    shell:
        """
        cat {input.metadata_query} > {output.metadata} && tail -n +2 \
        {input.metadata_background} >> {output.metadata}  
        2> {log} # Revoir le log 
        """