install.packages("lattice")
library(lattice)

attach(USMortality)
data(USM)
str(USMortality)

# Univariate Point Graph
dotplot(~Rate, data = USMortality, col = "red")
dotplot(~SE, USMortality, col = "blue")
# Bivariate Dot Graph
xyplot(Cause ~ Rate, USMortality, col = "purple")
xyplot(Status ~ Rate, USMortality, col = "blue")
dotplot(Sex ~ Rate, USMortality, col = "chocolate")
#Trivariate Point Graph
xyplot(Rate ~ SE | Sex, USMortality, col = "purple")

dotplot(Rate ~ SE | Status, USMortality, col = "blue")

xyplot(Rate ~ SE | Cause, USMortality, col = "purple")

#Bar grafikleri
barchart(Rate ~ Cause, USMortality,
         main = "Bar Chart in USMortality",
         xlab = "Cause Value",
         ylab = "Rate Value",
         col = c("chocolate", "green", "grey", "blue"))
barchart(SE ~ Rate | Cause, USMortality,
         main = "Bar Chart in USMortality",
         xlab = "Rate Value",
         ylab = "SE Value",
         col = c("chocolate", "red", "grey", "blue"),
         horiz = T)
barchart(SE ~ Rate | Status, USMortality,
         main = "Status Bar Chart in USMortality",
         xlab = "Rate Value",
         ylab = "SE Value",
         col = c("chocolate", "red", "grey", "blue"),
         horiz = F)
barchart(SE ~ Rate | Sex, USMortality,
         main = "Sex Bar Chart in USMortality",
         xlab = "Rate Value",
         ylab = "SE Value",
         col = c("red","chocolate","purple", "blue"),
         horiz = F)
#Pie Charts
install.packages("mlbench")
library(mlbench)

str(PimaIndiansDiabetes)
df = PimaIndiansDiabetes
df$diabetes = as.factor(df$diabetes)
pregnant = table(df$pregnant)
diabetes = table(df$diabetes)
age = table(df$age)
pie(pregnant, 
    labels = diabetes, 
    main="Pie Chart of Diabetes",
    )

#3D Pie Charts
install.packages("plotrix", dependencies = TRUE)
library(plotrix)

pie3D(pregnant,labels=diabetes,explode=0.1,
      main="Pie Chart of Diabetes ")

#Drawing Charts by Sorting by Groups
dotplot(~mass | diabetes, df, col = "blue")
df1 = data.frame(df, GR = factor(1))

dotplot(mass ~ GR | diabetes, data = df)

# Coloring Operations
red = rgb(249/255, 254/255, 47/255)
amber = rgb(255/255, 126/255, 0/255)
green = rgb(39/255, 121/255, 51/255)

bwplot(glucose ~ age , data = df, col = "black",
       panel = function(...){
         panel.bwplot(..., groups = df$diabetes,fill = c(red, amber, green))  
       })

