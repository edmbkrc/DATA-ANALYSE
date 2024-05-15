##DataExplorer
install.packages("DataExplorer")
library(DataExplorer)

data("PimaIndiansDiabetes2")
str(PimaIndiansDiabetes2)
df = PimaIndiansDiabetes2



plot_missing(df)

plot_bar(df)

plot_histogram(df[c("age", "pregnant", "pedigree")])


plot_boxplot(df, by = "diabetes")

plot_scatterplot(
  subset(df), 
  by = "diabetes")

plot_correlation(df)
