rule treetime_mugration:
    message:
        """
        Place Attribute to each tip in the tree
        Sample : {wildcards.sample}
        """
    conda:
        TREETIME
    params:
        attribute = ATTRIBUTES

    input: 
        time_scale_tree="results/99_FINAL_REPORT/{sample}_timetree.nexus",
        metadata = "results/00_Dataset/{sample}_metadata.tsv"
    output:
        mugration_dir = directory("results/05_Treetime_mugration/{sample}_tree/"),
        annotation = "results/05_Treetime_mugration/{sample}_tree/annotated_tree.nexus",
        annot_final = "results/99_FINAL_REPORT/{sample}_annotated_tree.nexus"
    log:
        multiext("results/log/{sample}_aligned_trimmed_tree_ancestral", ".log", ".txt") 
    shell: 
        """
        mkdir -p {output.mugration_dir}
        treetime mugration \
        --tree {input.time_scale_tree}   \
        --states {input.metadata}     \
        --attribute {params.attribute} \
        --outdir {output.mugration_dir} \
        --confidence
        echo 'Migration phylogenetic tree constructed {wildcards.sample}' >> {log}
        cp {output.annotation} {output.annot_final}
        """
