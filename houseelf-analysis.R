# This analysis is intended to print the average GC-contents for large and 
# small eared elves

#Importing elf data:
elf<-read.csv("houseelf_earlength_dna_data_1.csv", header=T)

GC_Content<- function(dnaseq){
#Function to calculate the GC content of a sequence
sequence<-str_to_upper(dnaseq)
Gs <- str_count(sequence, 'G')
Cs <- str_count(sequence, 'C')
gc_content <- (Gs + Cs) / str_length(sequence) * 100 
return(gc_content)
}

get_size_class <- function(seq){
   #Calculate the GC-content for one or more sequences
   ear_lengths <- ifelse(seq > 10, "large", "small")
   return(ear_lengths)
}
