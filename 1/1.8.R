# 1.8.1

get.category.ratings <- function(purchases, product.category) {
    setkey(product.category, product_id)
    setkey(purchases, product_id)
    merge(product.category, purchases, by = 'product_id')[,list(totalcents = sum(totalcents), quantity=sum(quantity)), by = category_id] 
}

# 1.8.2

mark.position.portion <- function(sample.purchases) {
  sample.purchases <- sample.purchases[quantity>0]
  sample.purchases[, "price.portion" := as.character(sprintf("%.2f",
  round(((quantity*price)/ sum(price*quantity))*100, 2))), 
                   by = ordernumber]}