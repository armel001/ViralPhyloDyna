
###############################################################################

rule initial_tree:
    message:
        """
        Building a phylogenetic tree using IQ-TREE
        Sample : {wildcards.sample}
        """
    conda:
        IQTREE
    resources:
        threads = 1
    params:
        model = "MF"
    input:
        msa = get_msa_input
        #msa_aligned_trimmed="results/01_Alignment/{sample}_aligned_trimmed.fasta"
        #msa_aligned_trimmed_subsampled="results/01_Alignment/{sample}_aligned_trimmed_subsampled.fasta"
    output: 
        tree="results/02_Phylogenetic_tree/{sample}_tree/{sample}_aligned_trimmed.fasta.treefile"
    log:
        "results/log/{sample}_aligned_trimmed_tree.log"
    shell: 
        """
        mkdir -p results/02_Phylogenetic_tree/{wildcards.sample}_tree
        iqtree -s {input.msa} -fast -m MF -alrt 1000 -nt AUTO > {log} 2>&1
        mv {input.msa}.* results/02_Phylogenetic_tree/{wildcards.sample}_tree/
        echo "Phylogenetic tree completed for {wildcards.sample}" >> {log}
        """

# replace mv input by a defintiion of output with --prefix or like ?
