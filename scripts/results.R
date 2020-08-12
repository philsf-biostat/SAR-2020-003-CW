source("scripts/input.R")
library(pander)

model.treat.t98strain <- aov(Absorbance ~ Treatment + Strain, data = df)

summary(model.treat.t98strain)
# pander(model.treat.t98strain)

TukeyHSD(model.treat.t98strain)
