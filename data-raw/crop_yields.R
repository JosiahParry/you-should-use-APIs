library(tidyverse)

key_crop_yields <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-01/key_crop_yields.csv')


clean_tt_names <- function(.x) tolower(stringr::str_remove(.x ,' \\([^)]*\\)'))  

crop_yields <- rename_with(key_crop_yields, clean_tt_names)

clean_yields <- crop_yields %>% 
  pivot_longer(cols = -c(entity, code, year),
               names_to = "product",
               values_to = "crop_yield") %>% 
  mutate(entity = tolower(entity)) %>% 
  select(-c("code"))

write_csv(clean_yields, "data/crop_yields.csv")

