# 2.3.1

mpg_facet <- ggplot(mtcars, aes(x = mpg)) +
  facet_grid(am ~ vs) +
  geom_dotplot()

# 2.3.2

sl_wrap <- ggplot(iris, aes(x = Sepal.Length)) +
  facet_wrap( ~ Species) +
  geom_density()

# 2.3.3

my_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_smooth() +
  facet_wrap( ~ Species)

# 2.3.4

my_plot <- ggplot(myMovieData, aes(x = Type, y = Budget)) +
  facet_grid(. ~ Year) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))