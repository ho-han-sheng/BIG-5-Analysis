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

table2 <- table1 %>% mutate(across(all_of(negscaled), ~NegtoPos(.)))

## Recode numerical codes into keywords

table3 <- table2 %>% mutate(gender = recode(gender, `1` = "Male", `2` = "Female", `3` = "Other", `0` = "Missed"))
table3 <- table3 %>% mutate(hand = recode(hand, `1` = "Right", `2` = "Left", `3` = "Both", `0` = "Missed"))
table3 <- table3 %>% mutate(engnat = recode(engnat, `1` = "Yes", `2` = "No", `0` = "Missed"))
table3 <- table3 %>% mutate(race = recode(race, `1` = "Mixed", `2` = "Arctic", `3` = "European", `4` = "Indian", `5` = "Middle East", `6` = "North African and Other", `7` = "Indigenous Australian", `8` = "Native American", `9` = "North East Asian", `10` = "Pacific", `11` = "South East Asian", `12` = "West African", `13` = "Other", `0` = "Missed"))

## Export csv file
write.csv(table2, file = "Data Output/tidy raw data.csv", sep = ",")
write.csv(table3, file = "Data Output/recode tidy data.csv", sep = ",")


## Summary statistics
summary(table3)
table(table3$race)
table(table3$engnat)
table(table3$gender)
table(table3$hand)
