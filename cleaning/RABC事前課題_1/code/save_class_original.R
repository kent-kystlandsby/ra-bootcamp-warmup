library(tidyverse)
library(readxl)

class_files <- list.files(path = "/Users/ki/Desktop/RABC事前課題_1/data/raw/assignment1_data/学級数/", full.names = TRUE)
file_names <- list.files(path = "/Users/ki/Desktop/RABC事前課題_1/data/raw/assignment1_data/学級数/", full.names = FALSE)
class_data <- map(class_files, ~read_xlsx(.)) %>% setNames(file_names)

for(i in 1:10){
  colnames(class_data[[i]]) <- c( "prefecture", "sum", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                                  "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24",
                                  "25-30", "31-36", "37-42", "43-48", "49-54", "55-60", "over_61")
}

saveRDS(class_data, file = "/Users/ki/Desktop/RABC事前課題_1/data/original/class_data.obj")
