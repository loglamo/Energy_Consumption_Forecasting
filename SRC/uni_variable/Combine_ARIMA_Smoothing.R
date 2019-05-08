library(forecast)
library(readr)
library(ggplot2)

energydata_complete <- read_csv("~/FinalProject2019/energydata_complete.csv")
appliances.all <- energydata_complete$Appliances
appliances.used <- appliances.all[43:length(appliances.all)]
appliances <- appliances.used[1:288]
appliances.ts <- ts(appliances, frequency = 144)

#arima 
forecast_test_arima <- c()
test <- appliances.used[289:298]

for(i in c(1:10)){
  appliances.i.training <- appliances.used[i:(i+287)]
  appliances.i.training.ts <- ts(appliances.i.training, frequency = 144)
  ARIMAfit.i = auto.arima(appliances.i.training.ts, seasonal = TRUE)
  forecast.i = forecast(ARIMAfit.i, h = 1, level = 5)
  #forecast.i.random <- runif(1, forecast.i$lower, forecast.i$upper)
  forecast.i.random = forecast.i$mean
  forecast_test_arima <- c(forecast_test_arima, forecast.i.random)
}

#HWS
test <- appliances.used[289:298]
forecast_test_hws <- c()

for(i in c(1:10)){
  appliances.i.training <- appliances.used[i:(i+287)]
  appliances.i.training.ts <- ts(appliances.i.training, frequency = 144)
  HWS.i = HoltWinters(appliances.i.training.ts)
  forecast.i = forecast(HWS.i, h = 1, level = 5)
  #forecast.i.random <- runif(1, forecast.i$lower, forecast.i$upper)
  forecast.i.random = forecast.i$mean
  forecast_test_hws <- c(forecast_test_hws, forecast.i.random)
}

forecast_test <- c()
for (i in c(1:10)){
  forecast_test <- c(forecast_test, (forecast_test_arima[i]+forecast_test_hws[i])/2)
  
}