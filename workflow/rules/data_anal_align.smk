

rule alignment:
    message:
        """
        Aligning the concatenated FASTA file
        Sample : {wildcards.sample}
        """
    conda:
        MAFFT
    resources:
        threads=THREADS_MAFFT
    input:
        msa="results/fasta_concat/{sample}_msa_rmdup.fasta"
    output:
        msa_aligned="results/alignment/{sample}_aligned.fasta"
    log:
        "results/log/{sample}_aligned.log"
    shell: 
        """
        mafft --thread {resources.threads} {input.msa} > {output.msa_aligned} 2>> {log}
        """