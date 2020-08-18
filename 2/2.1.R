# 2.1.1

depth_hist <- qplot(x = depth, data = diamonds)

# 2.1.2

price_carat_clarity_points <- qplot(data = diamonds, x = carat, y = price, color = clarity)

# 2.1.3

x_density <- qplot(data = diamonds, x = x, geom = "density")

# 2.1.4

x_cut_density <- qplot(data = diamonds, x = x, geom = "density", color = cut)

# 2.1.5

price_violin <- qplot(data = diamonds, x = color, y = price, geom = 'violin')