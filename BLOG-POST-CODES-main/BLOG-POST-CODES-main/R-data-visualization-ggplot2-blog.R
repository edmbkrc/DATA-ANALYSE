#I have activated the ggplot2 package
library(ggplot2)
#I looked through the general properties of the diabetes data that we will visualize with the str().
str(diabetes)

# I visualized the insulin and glucose features in the diabetes dataset, which have numeric values, with a point graph.
ggplot(data = diabetes)+
  geom_point(mapping = aes(x = glucose, y = insulin), color = "red")

#I can also get the same image without using data and mapping.
ggplot(diabetes)+
  geom_point(aes(x = glucose, y = insulin), color = "red")

#It can also be used this way.
ggplot(diabetes,aes(x = glucose, y = insulin))+
  geom_point(color = "red") 
#or 
ggplot(diabetes,aes(glucose, insulin))+
  geom_point(color = "red") 


#When I remove the color, it will use black color by default.
ggplot(diabetes)+
  geom_point(aes(x = glucose, y = insulin))

#I created a dot chart with the color I want by writing the color outside of aes in the previous chart. Now I will write the color in aes and examine the breakdowns of the feature(class) I want.
ggplot(diabetes)+
  geom_point(aes(x = glucose, y = insulin, color = class))

#If the data was continuous  then I would use size instead of color.
ggplot(diabetes)+
  geom_point(aes(x = glucose, y = insulin, size = class))

#shape makes the points on the chart appear in different shapes (triangle, square, etc.). In addition, more than 6 variables cannot be displayed on the chart with shape. That is, if the class had 8 variables instead of 3, only 6 would be visible and the other 2 would not.
ggplot(diabetes)+
  geom_point(aes(x = glucose, y = insulin, shape = class), color = "blue")

# alpha is used to make it transparent. However, it is not recommended to use categorical and discrete variables as in the size command.
ggplot(diabetes)+
  geom_point(aes(x = glucose, y = insulin, alpha = class), color = "purple")
Warning message:
  Using alpha for a discrete variable is not advised. 

# I think what comes to mind is what comes to mind for you too. So what happens if we use all the features at the same time? I think it's awesome.

ggplot(diabetes)+
  geom_point(aes(x = glucose, y = insulin, alpha = class, color = class, shape=class), color = "purple")

# glucose- sspg- class
ggplot(diabetes)+
  geom_point(aes(x = glucose, y = sspg, alpha = class, color = class, shape=class), color = "purple")

# Even if we don't specify x and y, it will detect it as default.
ggplot(diabetes)+
  geom_point(aes(glucose, sspg, color = class, alpha = class, shape=class), color = "purple")

# you can change the variables and I used the size
ggplot(diabetes)+
  geom_point(aes(glucose*2, insulin/sspg, size = class, alpha = class, shape=class), color = "purple")

# I think I caught your attention in terms of design. It can be used this way in long codes.
# we can also draw a line graph.

ggplot(diabetes, aes(glucose, insulin, 
                     color = class, 
                     alpha = class, 
                     shape=class))+
geom_point()+
geom_line()




