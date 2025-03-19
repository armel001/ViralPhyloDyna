
rule events_extaction:
    message:
        """
        Extract events from the tree for the sample : {wildcards.sample}
        Using Baltic script developed by @eduan and col.
        """
    conda:
        ANCESTRAL_CHANGES
    #params:
        #script = "scripts/AncestralChanges.py"
        #absolute_time = get_absolute_time(FILE). OK
        #absolute_time = get_absolute_time(data_prep.output.metadata)
        #absolute_time = lambda wildcards, input: get_absolute_time(input.metadata)
        #absolute_time = get_absolute_time("results/00_Dataset/{sample}_metadata.tsv")
    input:  
        metadata = "results/00_Dataset/{sample}_metadata.tsv",
        annotation = "results/05_Treetime_mugration/{sample}_tree/annotated_tree.nexus"
    output:
        events = "results/99_FINAL_REPORT/{sample}_annottated_tree_events.csv"
    log:
        "results/log/{sample}_aligned_trimmed_tree_events.log"
    script: "../scripts/AncestralChanges.py" 