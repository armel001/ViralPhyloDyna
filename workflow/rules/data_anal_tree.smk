
###############################################################################

rule initial_tree:
    message:
        """
        Building a phylogenetic tree using IQ-TREE
        """
    conda:
        "../envs/iqtree.yaml"
    input: 
        msa_aligned_trimmed="results/alignment/{sample}_aligned_trimmed.fasta"
    output: 
        tree="results/phylogenetic_tree/{sample}_tree/{sample}_aligned_trimmed.fasta.treefile"
    log:
        "results/log/{sample}_aligned_trimmed_tree.log"
    shell: 
        """
        mkdir -p results/phylogenetic_tree/{wildcards.sample}_tree
        iqtree -s {input.msa_aligned_trimmed} -fast -m MF -alrt 1000 -nt AUTO > {log} 2>&1
        mv {input.msa_aligned_trimmed}.* results/phylogenetic_tree/{wildcards.sample}_tree/
        echo "Phylogenetic tree completed for {wildcards.sample}" >> {log}
        """

