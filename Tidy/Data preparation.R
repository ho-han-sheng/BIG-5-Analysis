library(tidyverse)

## Import raw data into tibble
rawdata <- read_csv("data.csv")
as_tibble(rawdata)


## Tidying
table1 <- separate(rawdata, col = 1, into = c("race", "age", "engnat", "gender", 
                                              "hand", "source", "country", "E1",	
                                              "E2", "E3",	"E4",	"E5",	"E6",	"E7",	
                                              "E8",	"E9",	"E10", "N1", "N2",	"N3",	
                                              "N4",	"N5",	"N6",	"N7",	"N8",	"N9",	
                                              "N10",	"A1",	"A2",	"A3",	"A4",	"A5",	
                                              "A6",	"A7",	"A8",	"A9",	"A10",	"C1",	
                                              "C2",	"C3",	"C4",	"C5",	"C6",	"C7",	
                                              "C8",	"C9",	"C10",	"O1",	"O2",	"O3",	
                                              "O4",	"O5",	"O6",	"O7",	"O8",	"O9",	
                                              "O10"), convert = TRUE)


## Mutate negative scaled questions
negscaled <- c("E2", "E4", "E6", "E8", "E10", 
               "N1", "N3", "N5", "N7", 
               "A2", "A4", "A6", "A8", 
               "C1", "C3", "C5", "C6", "C7", "C8", "C9", "C10", 
               "O2", "O4", "O6")

as_tibble(negscaled)

## Returns absolute value after flipping scale
NegtoPos <- function(a) {
  a = abs(a - 6)
}

table2 <- table1 %>% mutate(across(negscaled, ~NegtoPos(.)))

## Export csv file
write.csv(table2, file = "Data Output/tidy raw data.csv", sep = ",")



