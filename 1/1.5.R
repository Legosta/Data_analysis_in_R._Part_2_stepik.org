# 1.5.1

d <- slice(diamonds, c(seq(1, nrow(diamonds), by = 2)))

# 1.5.2

my_df <- mtcars %>% 
  select(mpg, am, vs, hp) %>% 
  filter(mpg > 14, hp > 100) %>% 
  arrange(desc(mpg)) %>% 
  slice(1:10) %>%  
  rename(`Miles per gallon` = mpg, `Gross horsepower` = hp)