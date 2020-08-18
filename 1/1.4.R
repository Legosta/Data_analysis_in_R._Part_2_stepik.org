# 1.4.1

my_names <- function (dataset, names){
    dataset[grepl(paste(names, collapse = "|"), dataset$name),]
}

# 1.4.2

find_outliers <- function(test_data) {
  funny <- function(z) ifelse(abs(z) > mean(z) + 2*sd(z), 1, 0)
  var_fact <- names(which(sapply(test_data, is.factor)))
  var_num <- names(which(sapply(test_data, is.numeric)))
  res <- test_data %>%
    group_by_(.dots = var_fact) %>% 
    mutate_at(var_num, funs(is_outlier = funny))
  return(res)
}

# 1.4.3

smart_lm <- function(data) {
  satis_cols <- 
    names(which(sapply(data[-1], 
                       function(x) shapiro.test(x)$p.value > 0.05)))
  if (length(satis_cols) > 0) {
    pred_col <- colnames(data[1])
    foo <- as.formula(
      paste(pred_col,
            paste(satis_cols, collapse = " + "),
            sep = " ~ "))
    lm(foo, data = data)$coefficients
  } else {
    print("There are no normal variables in the data")
  }
}

# 1.4.4

one_sample_t <- function(data, param) {
  mu = param
  data <- data[sapply(data, is.numeric)]
  lapply(data, 
         function(x) c(t.test(x, mu = param)$statistic,
                       t.test(x, mu = param)$parameter,
                       t.test(x, mu = param)$p.value))
}

# 1.4.5

get_p_value <- function(test_list) {
  lapply(test_list, function(x) x$p.value)
}
