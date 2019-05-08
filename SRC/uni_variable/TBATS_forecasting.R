library(forecast)
library(readr)
library(ggplot2)

energydata_complete <- read_csv("~/FinalProject2019/energydata_complete.csv")
appliances <- energydata_complete$Appliances[1:300]
appliances.ts <- ts(appliances, frequency = 144)



gastbats <- tbats(appliances.ts)
fc2 <- forecast(gastbats, h=5)
plot(fc2, ylab="thousands of barrels per day")
appliances <- energydata_complete$Appliances[1:305]
appliances.ts <- ts(appliances, frequency = 144)