install.packages("tidyverse")
library(tidyverse)
library(readxl)

refusal_files <- list.files(path = "/Users/ki/Desktop/RABC事前課題作業/data/raw/assignment1_data/不登校生徒数/", full.names = TRUE)
refusal_files
file_names <- list.files(path = "/Users/ki/Desktop/RABC事前課題作業/data/raw/assignment1_data/不登校生徒数/", full.names = FALSE)
refusal_data <- map(refusal_files, ~read_xlsx(.)) %>% 
  setNames(file_names)
n_of_students <- read_xlsx("/Users/ki/Desktop/RABC事前課題作業/data/raw/assignment1_data/生徒数/生徒数.xlsx")

for(i in 1:10){
  colnames(refusal_data[[i]]) <- c("prefecture","refusal numbers","blank")
}
colnames(n_of_students) <- c("prefecture","year","number of students")

saveRDS(refusal_data, file = "/Users/ki/Desktop/RABC事前課題作業/data/original/refusal_data.obj")
saveRDS(n_of_students, file = "/Users/ki/Desktop/RABC事前課題作業/data/original/n_of_students.obj")