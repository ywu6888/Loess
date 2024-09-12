#这个loess可以用来观测变量之间的关系，是否线性以及复杂性，我认为是一个非常不错的方法
library(ggplot2)
data(iris)
ggplot(iris, aes(Sepal.Length, Petal.Length)) +
  geom_point() +
  geom_smooth(method=loess, span=0.5)   #more smooth, span more closed to 1 