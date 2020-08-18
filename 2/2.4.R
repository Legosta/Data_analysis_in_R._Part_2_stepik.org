iris_plot <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, col = Species)) +
  geom_point() +
  geom_smooth() +
  scale_color_discrete(name = "Вид цветка", label = c("Ирис щетинистый",
                                                      "Ирис разноцветный",
                                                      "Ирис виргинский")) +
  scale_x_continuous(name = "Длина чашелистика", limits = c(4,8)) +
  scale_y_continuous(name = "Длина лепестка", breaks = c(1,seq(1,7,1)),limits = c(1,7))