rule treetime_clock:
    message:
        """
        Verifiying molecular clock signal
        Sample : {wildcards.sample}
        """
    conda:
        TREETIME

    params:
        seq_len= SEQUENCE_LENGTH
    input:
        initial_tree="results/phylogenetic_tree/{sample}_tree/{sample}_aligned_trimmed.fasta.treefile",
        metadata="results/metadata_concat/{sample}_metadata.tsv"
    output:
        clock_dir = directory("results/treetime_clock/{sample}_tree/"),
       # final_dir = directory("results/{sample}_final_tree"),
        tree_clock="results/FINAL_REPORT/{sample}_root_to_tip_regression.pdf"
    log:
        "results/log/{sample}_aligned_trimmed_tree_clock.log"
    shell:
        """
        treetime clock \
        --tree {input.initial_tree} \
        --dates {input.metadata} \
        --sequence-length {params.seq_len} \
        --outdir {output.clock_dir}
        
        cp {output.clock_dir}/root_to_tip_regression.pdf {output.tree_clock}
        echo 'Phylogenetic tree molecular clock signal verification completed for {wildcards.sample}'
        >> {log}
        """