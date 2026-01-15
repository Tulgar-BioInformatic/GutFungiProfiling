# GutFungiProfiling
the goal of the project is to elaborate and define a method or approach to characterize the fungal part of the gut microbiota

4 objectives distributed in two approaches:
  - Approach 1: Read based profiling
      - objective 1: give a workflow/pipeline to obtain qualitative an quantitative information about fungi composition from metagenomes obtained in fecal samples, with these metagenomes, and database, obtain these informations
      - objective 2: build a database from public sources

  - Approach 2: addition of a Co-Assembling strategy
      - objective 1: give a specific database builded from the project metagenomes to enrich the read based profiling, evaluate if this enrichment improves the profiling or not
      - objective 2: give the workflow/pipeline to build the specific database from the project metagenomes
   


shotgun, around 100M reads per sample (after Human contamination removal), majority of these reads are Bacterial, only around 0.1% are fungal or others (eukaryota,protozoan,viral, aliment?, and others...). so we get per sample around 100k reads, multiplied by around 100bp for each read (paired end), we get 10M bases, S.cerevisiae = 12M b. so we don't get the full genomes, only a small part.
Using a read based profiling method, the principle is to map these reads on reference datasets (builded from public and builded from our metagenomes (Approach 2), and from this mapping, obtain qualitative information (presence abscence) and quantitative (aboundance)).



## first step: 
from a given metagenome, i want to take out the bacterial reads, and keep the Others reads (maybe aim for fungi at this step, or after)
to distinguish these groups (Bacterial, Fungi, Others) i'll do mapping on databases. so i need to build datasets from public DBs. 



to profile there are two approaches: confront to a reference genome db, or confront to a genes list that are shared/conserved and ideally specific at the same time (for a given gene, every fungi has it, and every fungi have a different version of it)
