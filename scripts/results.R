source("scripts/input.R")

model.treat.t98strain <- aov(Absorbance ~ Treatment + Strain, data = df)

summary(model.treat.t98strain)
TukeyHSD(model.treat.t98strain)
