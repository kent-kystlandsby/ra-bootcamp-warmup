refusal_data <- readRDS("/Users/ki/Desktop/RABC事前課題作業/data/original/refusal_data.obj")
n_of_students <- readRDS("/Users/ki/Desktop/RABC事前課題作業/data/original/n_of_students.obj")

#delete blank
for(i in 1:10){
  refusal_data[[i]] <-
  refusal_data[[i]] %>% 
    select(!blank)
}

#chr to numeric : refusal numbers
for(i in 1:10){
  refusal_data[[i]]$`refusal numbers` <-
    refusal_data[[i]]$`refusal numbers` %>% 
    as.numeric()
}

#add year
for(i in 1:10){
  refusal_data[[i]] <-
    refusal_data[[i]] %>% 
    mutate(year = 2012 + i)
}

#combine dataframes
combined_refusal <-
  refusal_data %>% bind_rows()

bind_rows(.id = ) 

n_of_students

#join
joined_data <-
  left_join(n_of_students, combined_refusal, by = c('prefecture', 'year'))
  
joined_data <-
  joined_data %>% 
  mutate(refusal_rate = `refusal numbers`/`number of students`)

saveRDS(joined_data, file = "/Users/ki/Desktop/RABC事前課題作業/data/cleaned/refusal_joined.obj")



