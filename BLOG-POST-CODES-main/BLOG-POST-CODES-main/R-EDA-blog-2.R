library(ggplot2) # Data visualization
library(readr) #reading csv file

# Load dataset
df = read.csv("C:/Users/Asus/Desktop/VERİ BİLİMİ YÜKSEK LİSANS/R -Data Visualisation/blog/blog-2/diabetes.csv")
str(df)
head(df)
View(diabetes)
tail(df)
summary(df)
library(psych)
describe(df)

install.packages("ggcorrplot")
library(ggcorrplot)
# Compute correlation matrix

df_cor = round(cor(df),2)
df_cor
ggcorrplot(df_cor)

# Barplot by Outcome
ggplot(aes(x = Outcome), data = df) +
  geom_bar(fill='steelblue')
# histogram-age
ggplot(aes(x = Age), data=df) +
  geom_histogram(binwidth=1, color='black', fill = "#F79420") +
  scale_x_continuous(limits=c(20,90), breaks=seq(20,90,5)) +
  scale_y_continuous(limits=c(0,80), breaks=seq(0,80,10))+
  labs(xlab = "Age",
       ylab = "Frequency",
       title = "AGE FREQUENCY")
# histogram-BMI
ggplot(aes(x = BMI), data=df) +
  geom_histogram(binwidth=1, color='red', fill = "purple") +
  scale_x_continuous(limits=c(0,70), breaks=seq(0,70,5)) +
  scale_y_continuous(limits=c(0,60), breaks=seq(0,60,5))+
  labs(xlab = "BMI",
       ylab = "Frequency",
       title = "BMI FREQUENCY")+
  theme_light()
# Histogram-Glucose
ggplot(aes(x = Glucose), data=df) +
  geom_histogram(binwidth=2, color='yellow', fill = "#7030A0") +
  scale_x_continuous(limits=c(0,200), breaks=seq(0,200,10)) +
  scale_y_continuous(limits=c(0,30), breaks=seq(0,30,2))+
  labs(xlab = "BMI",
       ylab = "Frequency",
       title = "BMI FREQUENCY")+
  theme_dark()
df$Outcome = as.factor(df$Outcome)
str(df)
ggplot(df, aes(x = Glucose,  fill = Outcome)) + 
  geom_bar(color = "blue",
           size = 3) +
  labs(x = "Glucose",
       y = "Frequency",
       title = "Glucose-Outcome")


p1 = ggplot(data = df) +
       geom_bar(
         mapping = aes(x = Glucose, fill = Outcome),
         position = "dodge",
         size = 2
              )+
       labs(x = "Glucose",
            y = "Frequency",
            title = "Glucose-Outcome")+
       theme_dark()
p2 = ggplot(data = df) +
  geom_bar(
    mapping = aes(x = BMI, fill = Outcome),
    position = "nudge",
    size = 2
  )+
  labs(x = "BMI",
       y = "Frequency",
       title = "BMI-Outcome")
p3 = ggplot(data = df) +
  geom_bar(
    mapping = aes(x = Age, fill = Outcome),
    position = "stack",
    size = 2
  )+
  labs(x = "Age",
       y = "Frequency",
       title = "Age-Outcome")+
  theme_cowplot()
  

plot_grid(p1, p2, p3, labels = "AUTO", ncol=3)


ggplot(df, aes(Glucose, 
               BMI,
               color = Outcome,
               shape=Outcome))+
  geom_point()+
  geom_line()
boxplot(df)
#glucose outlier detection
ggplot(data = df,
       mapping = aes(x=Glucose)) +
  stat_boxplot(aes(Glucose),
               geom="errorbar", linetype=1, width=0.5) +
  geom_boxplot(outlier.color="red",
               notch=FALSE,
               fill="purple") +
  coord_flip() +
  facet_grid(. ~Outcome)
#BMI outlier detection
ggplot(data = df,
       mapping = aes(x=BMI)) +
  stat_boxplot(aes(BMI),
               geom="errorbar", linetype=1, width=0.5) +
  geom_boxplot(outlier.color="red",
               notch=FALSE,
               fill="blue") +
  coord_flip() +
  facet_grid(. ~Outcome)

# Age outlier detection
ggplot(data = df,
       mapping = aes(x=Age)) +
  stat_boxplot(aes(Age),
               geom="errorbar", linetype=1, width=0.5) +
  geom_boxplot(outlier.color="red",
               notch=FALSE,
               fill="orange") +
  coord_flip() +
  facet_grid(. ~Outcome)
