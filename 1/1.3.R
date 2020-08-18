# 1.3.1

get_negative_values <- function(test_data){
  res<-apply(test_data,2, function(x) x[!is.na(x) & x<0])
  return(res[sapply(res,function(x) length(x)>0 )])}

# 1.3.2

na_rm <- function(x) {
  res1 <- function(y) {y[is.na(y)] <- mean(y, na.rm=T); y}
  return(as.data.frame(apply(x,2,res1)))
}