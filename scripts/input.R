library(readxl)
library(data.table)
df <- read_excel("dataset/MTT-29-July-20-graph.xls", 
                 range = "A1:D85")
df <- data.table(df)
names(df) <- c("Well", "Treatment", "Type", "Absorbance")

df$Well <- factor(df$Well)

df$Treatment <- factor(df$Treatment)
df$Treatment <- relevel(df$Treatment, "No Treatment")

df$Type <- factor(df$Type)
df$Type <- relevel(df$Type, "T98G-WT")
