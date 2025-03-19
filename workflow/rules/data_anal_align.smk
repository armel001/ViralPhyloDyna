

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
        msa="results/00_Dataset/{sample}_msa_rmdup.fasta"
    output:
        msa_aligned="results/01_Alignment/{sample}_aligned.fasta"
    log:
        "results/log/{sample}_aligned.log"
    shell: 
        """
        mafft --thread {resources.threads} {input.msa} > {output.msa_aligned} 2>> {log}
        """