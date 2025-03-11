
###############################################################################

rule mask_alignment:
    message:
        """
        Masking and trimming the alignment using Gblocks
        Sample : {wildcards.sample}
        """
    conda:
        GBLOCKS
    input: 
        msa_aligned="results/alignment/{sample}_aligned.fasta"
    output: 
        msa_aligned_trimmed="results/alignment/{sample}_aligned_trimmed.fasta"
    log:
        "results/log/{sample}_aligned_trimmed.log"
    shell: 
        """
        set +e  
        Gblocks {input.msa_aligned} \
        -t=d \
        -b5=h \
        > {log} \
        2>&1
        mv {input.msa_aligned}-gb {output.msa_aligned_trimmed}
        echo "Masking completed for {wildcards.sample}" >> {log}
        set -e  
        """




