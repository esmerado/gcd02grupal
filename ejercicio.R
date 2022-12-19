library(ggplot2)
library(plotly)
library(BayesFactor)
library(rstanarm)
library(see)
library(bayestestR)

rawdata <- airquality
temp <- airquality$Temp
ozone <- airquality$Ozone

## Pearson Correlation.
corTest <- cor.test(temp, ozone)

## Correlation BF.
cbf <- correlationBF(ozone, temp, rscale = "wide", posterior = TRUE,
              iterations = 10000)
bayesPlot <- cbf[,"rho"]

## Linear regresión plot.
linearRegresion <- ggplot(rawdata, aes(x=Temp, y=Ozone)) +
  geom_point(shape=1) +
  geom_smooth(method=lm)

## Bayes Factor for the pizza plot.
pizzabf <- bayesfactor(correlationBF(temp, ozone))
