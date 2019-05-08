library(forecast)
library(readr)
library(ggplot2)

energydata_complete <- read_csv("~/FinalProject2019/energydata_complete.csv")
appliances.all <- energydata_complete$Appliances
appliances.used <- appliances.all[43:length(appliances.all)]
appliances <- appliances.used[1:288]
appliances.ts <- ts(appliances, frequency = 144)

# plot(appliances.ts, xlab='Time', ylab = 'Energy')
# plot(diff(appliances.ts),ylab='Differenced Tractor Energy')# smoothing
# plot(diff(log10(appliances.ts)),ylab='Differenced Log (Tractor Energy)')
# par(mfrow = c(1,2))
# acf(ts(diff(log10(appliances.ts))),main='ACF Tractor Sales')
# pacf(ts(diff(log10(appliances.ts))),main='PACF Tractor Sales')

# ARIMAfit = auto.arima(appliances.ts, seasonal = TRUE)
# par(mfrow = c(1,1))
# pred = forecast(ARIMAfit, h = 30, level = 5)
forecast_test <- c()
test <- appliances.used[289:298]

for(i in c(1:10)){
  appliances.i.training <- appliances.used[i:(i+287)]
  appliances.i.training.ts <- ts(appliances.i.training, frequency = 144)
  ARIMAfit.i = auto.arima(appliances.i.training.ts, seasonal = TRUE)
  forecast.i = forecast(ARIMAfit.i, h = 1, level = 5)
  #forecast.i.random <- runif(1, forecast.i$lower, forecast.i$upper)
  forecast.i.random = forecast.i$mean
  forecast_test <- c(forecast_test, forecast.i.random)
}




