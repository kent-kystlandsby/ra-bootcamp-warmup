class_data <- readRDS("/Users/ki/Desktop/RABC事前課題作業/data/original/class_data.obj")

class_data <- class_data %>% setNames(2013:2022)



class_data_cleaned <- class_data %>% map(~{
  
  new_names <- .x[1, ] %>% unlist() %>% str_remove_all("学級") 
  
  .x %>% set_names(new_names) %>% rename_with(~"prefecture", .cols = 1) %>% 
  slice(-1) %>% select(-計) %>% mutate(across(-prefecture, as.numeric))})

class_data_joined <- class_data_cleaned %>% map(~ .x %>% mutate(prefecture_id = 1:47)) %>% 
  list_rbind(names_to = "year") %>% arrange(prefecture_id, year)

print(class_data_joined, n = 20)