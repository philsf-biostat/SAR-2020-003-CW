library(readxl)
library(data.table)

df <- read_excel("dataset/MTT-29-July-20-graph.xls", 
                 range = "A1:D85")
df <- data.table(df)
names(df) <- c("Well", "Treatment", "Type", "Absorbance")

# add blank values
blank.raw <- read_excel("dataset/MTT-29-July-20-graph.xls", 
                       range = "O1:P5")
blank.raw <- data.table(blank.raw)

# AmB is defined as Absorbance minus Blank
# df[, c("AmB") := .(AmB = mean(Absorbance) - mean(blank.raw$`Absorbance 570/40 (A)`)), by = .(Treatment, Type)] # for testing only
df[, c("AmB") := .(AmB = Absorbance - mean(blank.raw$`Absorbance 570/40 (A)`)), by = .(Treatment, Type)]

# split type column
df[, c("CLine", "Strain") := tstrsplit(Type, "-", fixed = TRUE)]

# filter only t98 cell line
df <- df[CLine == "T98G"]

df$Well <- factor(df$Well)

df$Treatment <- factor(df$Treatment)
df$Treatment <- relevel(df$Treatment, "No Treatment")

df$Type <- factor(df$Type)
df$Type <- relevel(df$Type, "T98G-WT")

df$CLine <- factor(df$CLine)
df$Strain <- factor(df$Strain)
df$Strain <- relevel(df$Strain, "WT")
