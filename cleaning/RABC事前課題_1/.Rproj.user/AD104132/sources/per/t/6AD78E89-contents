class_data <- readRDS("/Users/ki/Desktop/RABC事前課題_1/data/original/class_data.obj")

#dfの名前設定
class_data <- class_data %>% setNames(2013:2022)

#学級の取り除きと変数名の再設定、「計」列の削除

class_data_cleaned <- class_data %>% map(~{
  
  new_names <- .x[1, ] %>% unlist() %>% str_remove_all("学級")
  
  .x %>% set_names(new_names) %>% rename_with(~"prefecture", .cols = 1) %>%
    slice(-1) %>% select(-計) %>% mutate(across(-prefecture, as.numeric))})

#都道府県番号と結合、並び替え。年列も追加

yearname = 2013:2022

class_data_cleaned2 <- class_data_cleaned %>% map(~ .x %>% mutate(prefecture_id = 1:47))
class_data_cleaned3 <- class_data_cleaned2 %>% seq_along() %>% map (~ class_data_cleaned2[[.x]] %>% mutate(year = yearname[.x]))
class_data_joined <- class_data_cleaned3 %>% bind_rows() %>% arrange(prefecture_id, year)

#データをlong型に

class_data_names <- 1:24
class_data_names <- class_data_names %>% as.character()

class_data_joined_long <- class_data_joined %>% gather(key = "学級数", value = "該当数", '0', class_data_names, '25～30', '31～36', '37～42', '43～48', '49～54', '55～60', '61以上')
class_data_joined_long <- class_data_joined_long %>% select(-c('61\n以上', '61\r\n以上'))