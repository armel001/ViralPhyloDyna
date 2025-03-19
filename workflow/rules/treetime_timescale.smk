rule treetime_timescale:
    message:
        """
        Inferring time-scale phylogenetic tree using treetime
        Sample : {wildcards.sample}
        """
    conda:
        TREETIME
    params:
        clock_rate = TREETIME_CLOCK_RATE,
        clock_std_dev = TREETIME_CLOCK_STD_DEV

    input: 
        initial_tree="results/02_Phylogenetic_tree/{sample}_tree/{sample}_aligned_trimmed.fasta.treefile",
        alignment="results/01_Alignment/{sample}_aligned.fasta",
        metadata = "results/00_Dataset/{sample}_metadata.tsv"
    output:
        ancestral_dir = directory("results/04_Timescale_tree/{sample}_tree/"),
        time_scale_tree = "results/99_FINAL_REPORT/{sample}_timetree.nexus"
    log:
        "results/log/{sample}_aligned_trimmed_tree_ancestral.log"
    shell: 
        """
        treetime --aln {input.alignment} \
        --tree {input.initial_tree}   \
        --dates {input.metadata}     \
        --clock-rate {params.clock_rate} \
        --clock-std-dev {params.clock_std_dev} \
        --outdir {output.ancestral_dir} \
        --confidence
        cp {output.ancestral_dir}/timetree.nexus {output.time_scale_tree}
        echo 'Time scale phylogenetic tree constructed {wildcards.sample}' >> {log}
        """
