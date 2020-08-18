# 1.6.1

all_to_factor <- function(x) {
  as.data.frame(sapply(x, function(x) as.factor(x), simplify = F))
}

# 1.6.2

rescale <- function(x) {
  1 + ((x - min(x)) / (max(x) - min(x))) 
}

log_transform <- function(x) {
  y <- mutate_if(x, is.numeric, rescale)
  z <- mutate_if(y, is.numeric, log)
  return(z)
}

# 1.6.3

descriptive_stats <- function(test_data) {
  test_data %>% 
    group_by(gender, country) %>% 
    summarize_all(funs(n = n(), mean = mean(., na.rm = T), sd = sd(., na.rm = T), median = median(., na.rm = T), first_quartile = unname(quantile(., na.rm = T)[2]), third_quartile = unname(quantile(., na.rm = T)[4]), na_values = sum(is.na(.))))
}

# 1.6.4

to_factors <- function (data, factors){
  data[factors] <- data[factors] %>% 
    mutate_if(is.numeric, funs(as.factor(ifelse(. > mean(., na.rm = T), 1, 0))))
  return(data)
}

# 1.6.5

data <- dplyr::group_by(diamonds, color)
high_price <- data_frame()
for (i in levels(diamonds$color)) {
  res <- data %>% 
    filter(color == i) %>% 
    arrange(desc(price)) %>% 
    select(color, price) %>% 
    head(10)
  high_price <- bind_rows(high_price, res)
}