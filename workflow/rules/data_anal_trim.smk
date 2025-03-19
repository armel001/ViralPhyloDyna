
###############################################################################

rule mask_alignment:
    message:
        """
        Masking and trimming the alignment using Gblocks
        Sample : {wildcards.sample}
        """
    conda:
        GBLOCKS
    
    params:
        type    = TYPE_DNA,        # Type of sequences, d = DNA, p = protein, c = codon
        b5      = CONSERV_POST    # Treatment of positions with low retention rates, h = less strict, n = strict
    input: 
        msa_aligned="results/01_Alignment/{sample}_aligned.fasta"
    output: 
        msa_aligned_trimmed="results/01_Alignment/{sample}_aligned_trimmed.fasta"
    log:
        "results/log/{sample}_aligned_trimmed.log"
    shell: 
        """
        set +e  
        Gblocks {input.msa_aligned} \
        -t={TYPE_DNA} \
        -b5={CONSERV_POST}  \
        > {log} \
        2>&1
        mv {input.msa_aligned}-gb {output.msa_aligned_trimmed}
        echo "Masking completed for {wildcards.sample}" >> {log}
        set -e  
        """

###############################################################################
rule subsampling:
    message:
        """
        Subsampling the alignment
        Sample : {wildcards.sample}
        """
    conda:
        SEQKIT
    params:
        #subsample_size = SUBSAMPLE_SIZE
    input: 
        msa_aligned_trimmed="results/01_Alignment/{sample}_aligned_trimmed.fasta"
    output: 
        msa_aligned_trimmed_subsampled="results/01_Alignment/{sample}_aligned_trimmed_subsampled.fasta"
    log:
        #"results/log/{sample}_aligned_trimmed_subsampled.log"
    shell: 
        """
        cp {input.msa_aligned_trimmed} {output.msa_aligned_trimmed_subsampled}
        """

