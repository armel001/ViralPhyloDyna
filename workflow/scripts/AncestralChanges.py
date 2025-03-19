"""
Created on Tue 9 April 2019 

@authors: david rasmussen
@edited: eduan wilkinson
"""
import baltic as bt
import pandas as pd
from scripts.functions import get_absolute_time

#treeFile = "annotated_tree.nexus"
#outFile = 'annottated_tree_events.csv'
#myTree=bt.loadNewick(treeFile, absoluteTime=False)
#myTree.setAbsoluteTime(2021.1) # need to set this to time of last sampled tip

treeFile = snakemake.input.annotation
outFile = snakemake.output.events
myTree=bt.loadNewick(treeFile, absoluteTime=False)
absolute_time = get_absolute_time(snakemake.input.metadata)

myTree.setAbsoluteTime(absolute_time) # need to set this to time of last sampled tip

myTree.traverse_tree() ## required to set heights
myTree.treeStats() ## report stats about tree

changes = 0
times = []
origins = []
destinations = []
for k in myTree.Objects: ## iterate over a flat list of branches
    
    "Assign node UNKNOWN country if not give"
    if 'country' in k.traits:
        country = k.traits['country']
    else:
        country = 'UNKNOWN'
        k.traits['country'] = country 
    
    "Find parent country if given"
    if k.parent.traits:
        parent_country = k.parent.traits['country']
    else:
        parent_country = 'UNKNOWN'
        
    if country != parent_country:
        changes += 1
        times = times + [k.absoluteTime]
        origins = origins + [parent_country]
        destinations = destinations + [country]
        
        
print("Total number of state changes: " + str(changes))

df = pd.DataFrame({'EventTime' : times})
df['Origin'] = origins
df['Destination'] = destinations

df.to_csv(outFile)  
    

