###############################################################################

rule alignment:
    # Aim: Used to align the concatenated FASTA file
    # Use: mafft
    message:
        """
        Aligning the concatenated FASTA file
        """
    conda:
        "../envs/mafft.yaml"
    input: 
        msa = "results/fasta_concat/{wildcard}_msa.fasta"
    output: 
        msa_aligned = "results/alignment/{wildcard}_aligned.fasta"
    log:
        "results/log/{wildcard}_aligned.log"
    shell: 
        """
        mafft {input.msa} > {output.msa_aligned} 2> {log}
    """