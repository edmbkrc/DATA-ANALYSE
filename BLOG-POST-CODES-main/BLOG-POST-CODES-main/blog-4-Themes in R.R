library(ggplot2)
#Create some sample data
x = rnorm(50)
y = rnorm(50)

# Use ggplot() to create a basic scatter plot
ggplot(data = data.frame(x, y), aes(x = x, y = y)) +
  geom_point()

#Create a custom theme using the theme() function
my_theme = theme(plot.background = element_rect(fill = "darkgray"),
                 plot.title = element_text(size = 18))

#Apply the custom theme to the plot
ggplot(data = data.frame(x, y), aes(x = x, y = y)) +
  geom_point() +
  my_theme
install.packages(MASS, dependencies = TRUE )
library(MASS)

View(birthwt)
str(birthwt)

ggplot(birthwt, aes(age, bwt, color = factor(smoke))) +
  geom_jitter() +
  geom_abline(colour = "grey50", linewidth = 2) +
  ggthemes::theme_economist()+
  labs(x = "Mother's Age in Years",
       y  = "Birth Weight in Grams",
       title = "AGE-BWT-SMOKE") +
  scale_color_brewer(type = "seq", palette = "Spectral") + 
 
#theme_bw()
ggplot(birthwt, aes(age, bwt, color = factor(smoke))) +
  geom_jitter() +
  geom_abline(colour = "grey50", linewidth = 2) +
  labs(x = "Mother's Age in Years",
       y  = "Birth Weight in Grams",
       title = "AGE-BWT-SMOKE") +
  scale_color_brewer(type = "seq", palette = "Spectral") +  
  theme_bw() + 
#theme() 
ggplot(birthwt, aes(ftv, ptl, color = factor(race))) +
  geom_jitter() +
  geom_abline(colour = "grey50", linewidth = 2) +
  labs(x = "number of physician visits",
       y  = "number of previous premature labours",
       title = "FTV-PTL-RACE") +
  scale_color_brewer(type = "seq", palette = "Spectral") + 
  theme(plot.title = element_text(face = "bold", size = 12),
        legend.background = element_rect(fill = "white",
                                         linewidth = 4,
                                         colour = "white"),
        legend.justification = c(0,1),
        legend.position = c(0,1),
        axis.ticks = element_line(colour = "grey70", linewidth = 0.2),
        panel.grid.major = element_line(colour = "grey70", linewidth = 0.2),
        panel.grid.minor = element_blank()
  )
# theme_dark()
ggplot(birthwt) +
  geom_point(aes(x = age, y = lwt, colour = factor(smoke))) +
  labs(
    title = "AGE-LWT-SMOKE",
    subtitle = "USA",
    caption = "It contains information on the birth weights of babies born in the United States.",
    tag = "Figure 1",
    x = "mother's age in years",
    y = "mother's weight",
    colour = "smoke") +
  theme_dark()

install.packages("hrbrthemes")
library(hrbrthemes)
ggplot(birthwt, aes(x = age, fill = race)) +
  geom_density(alpha = 0.7) + 
  ggtitle("Plot title") +
  theme_ipsum() + # Arial Narrow
  scale_fill_ipsum() +
  theme(legend.position = "top")

ggplot(data = birthwt,
       mapping = aes(x=age)) + 
  geom_boxplot(outlier.color="red",
               notch=FALSE,
               fill="blue") +
  coord_flip() +
  facet_grid(. ~smoke) +
  ggthemes::theme_calc()
