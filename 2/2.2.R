# 2.2.1

my_plot <- ggplot(mtcars,aes(x = factor(am), y = mpg)) + 
  geom_violin() +
  geom_boxplot(width = 0.2)

# 2.2.2

my_plot <- ggplot(sales, aes(x = income, y = sale)) +
  geom_point(aes(color = shop)) +
  geom_smooth()

# 2.2.3

my_plot <- ggplot(sales, aes(x = shop, y = income, col = season))+
  stat_summary(fun.data = mean_cl_boot, position = position_dodge(0.2))

# 2.2.4

my_plot <- ggplot(sales, aes(x = date, y = sale, group = shop, col = shop))+
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(0.2)) + # добавим стандартную ошибку
  stat_summary(fun.data = mean_cl_boot, geom = "point", position = position_dodge(0.2)) + # добавим точки
  stat_summary(fun.data = mean_cl_boot, geom = "line", position = position_dodge(0.2))