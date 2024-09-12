#这个loess可以用来观测变量之间的关系，是否线性以及复杂性，我认为是一个非常不错的方法
#先加载必要的数据和包
library(ggplot2)
data(iris)

#数据的解释

#Sepal.Length，Petal.Length，Sepal.Width，Petal.Width都是四个连续变量，Species为类别变量

###第一种：我们现在有两个连续的自变量

# 通过颜色区分另一个连续自变量，并自定义颜色渐变，即把Sepal.Width映射
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Sepal.Width)) +
  geom_point() +
  geom_smooth(method = "loess", span = 0.5,color = 'purple') +
  scale_color_gradient(low = "green", high = "red")  # 自定义颜色从绿到红

###第二种：我们现在有一个连续变量和一个分类变量

library(ggplot2)
data(iris)
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point() +
  geom_smooth(method = "loess", span = 0.5) +
  scale_color_manual(values = c("setosa" = "red", "versicolor" = "green", "virginica" = "purple"))  # 自定义颜色

###除了颜色外，你还可以将额外的自变量映射到以下属性：
##形状 (shape)：适用于离散变量，将不同的类别映射到不同的点形状。
##大小 (size)：适用于连续或离散变量，用于调整点的大小。
##透明度 (alpha)：适用于连续或离散变量，通过透明度来区分数据点。
##线型 (linetype)：适用于离散变量，用于区分不同类别的线型。

# 将 Species 映射到形状，现在是一个分类和两个连续
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Sepal.Width, shape = Species)) +
  geom_point() +
  geom_smooth(method = "loess", span = 0.5) +
  scale_color_gradient(low = "green", high = "red")  # 自定义颜色从绿到红


# 将 Sepal.Width 映射到大小，将 Petal.Width 映射到颜色，三个连续
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Petal.Width, size = Sepal.Width)) +
  geom_point() +
  geom_smooth(method = "loess", span = 0.5) +
  scale_color_gradient(low = "green", high = "red") 


# 将 Sepal.Width 映射到透明度，三个连续变量
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Petal.Width, alpha = Sepal.Width)) +
  geom_point() +
  geom_smooth(method = "loess", span = 0.5) +
  scale_color_gradient(low = "blue", high = "red")


# 将 Species 映射到线型，一个分类，两个连续
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Sepal.Width, linetype = Species)) +
  geom_point() +
  geom_smooth(method = "loess", span = 0.5) +
  scale_color_gradient(low = "blue", high = "red")


#对自变量为类别，其实用loess只能将其映射而不能作为XY轴，所以用boxplot会更好
# 使用箱线图显示类别变量与连续变量之间的关系
ggplot(iris, aes(Species, Petal.Length, color = Sepal.Width)) +
  geom_boxplot() +
  scale_color_gradient(low = "blue", high = "red")+
  geom_jitter(width = 0.1, alpha = 0.5)  # 添加抖动点图以显示数据分布
