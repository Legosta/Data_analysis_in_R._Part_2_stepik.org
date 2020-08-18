# 1.7.1

filter.expensive.available <- function(data, vect) {
  dat <- data[(price>500000) & (brand %in% vect) & (available == T), 
                 .(price, available, brand)]
  return(dat)
}

# 1.7.2

ordered.short.purchase.data <- function(data){
  data <- data[quantity > 0]
  data <- data[order(price, decreasing = T)]
  data <- data[, list(ordernumber, product_id)]
  return(data)
}

# 1.7.3

purchases.median.order.price <- function(purchases) {
    median(purchases[quantity > 0, list(summa = sum(price*quantity)), by = ordernumber]$summa)
}

