refusal_data <- readRDS("/Users/ki/Desktop/RABC事前課題_1/data/original/refusal_data.obj")
n_of_students <- readRDS("/Users/ki/Desktop/RABC事前課題_1/data/original/n_of_students.obj")

#blankを削除
for(i in 1:10){
  refusal_data[[i]] <-
  refusal_data[[i]] %>% 
    select(!blank)
}

#refusal numbersの型変更
for(i in 1:10){
  refusal_data[[i]]$`refusal numbers` <-
    refusal_data[[i]]$`refusal numbers` %>% 
    as.numeric()
}

#year列の追加
for(i in 1:10){
  refusal_data[[i]] <-
    refusal_data[[i]] %>% 
    mutate(year = 2012 + i)
}

#結合
combined_refusal <-
  refusal_data %>% bind_rows()

n_of_students

#join
joined_data <-
  left_join(n_of_students, combined_refusal, by = c('prefecture', 'year'))
  
joined_data <-
  joined_data %>% 
  mutate(refusal_rate = `refusal numbers`/`number of students`)

saveRDS(joined_data, file = "/Users/ki/Desktop/RABC事前課題_1/data/cleaned/refusal_joined.obj")



