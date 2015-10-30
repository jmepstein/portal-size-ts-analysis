# This analysis is intended to print the average GC-contents for large and 
# small eared elves

library(stringr)

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

#Write some new code that creates a data frame with information about the 
#individual ID, the earth length class, and the gc-content for each individual

#Empty data frame:
output <- data.frame()

size_and_GC_content<- for(row in 1:nrow(elf)){
  #For loop to get the earlength category and GC content for each row and store them
  ear_size_per_row <- get_size_class(elf[row,]$earlength)
  GCContent <- GC_Content(elf[row,]$dnaseq)
  elf_output<- data.frame(elf[row,]$id, ear_size_per_row, GCContent)
  output<-rbind(output, elf_output)
}
print(output)

#Export table to csv file:
write.csv(output, file = "git_elf_earlength_GCcontent.csv")
