rule treetime_clock:
    message:
        """
        Verifiying molecular clock signal 
        """
    conda:
        "../envs/treetime.yaml"
    input: 
        initial_tree="results/phylogenetic_tree/{sample}_tree/{sample}_aligned_trimmed.fasta.treefile"
    output: 
        tree_clock="results/treetime_clock/{sample}_tree/{sample}_aligned_trimmed.fasta.clock.nexus"
    log:
        "results/log/{sample}_aligned_trimmed_tree_clock.log"
    shell: 
        """
        mkdir -p results/treetime_clock/{wildcards.sample}_tree
        treetime clock --tree {input.initial_tree} --dates \
        "results/metadata_concat/{wildcards.sample}_metadata.tsv" --sequence-length 29701
        echo "Phylogenetic tree molecular clock signal verification completed for {wildcards.sample}" >> {log}
        """