library(vars)
library(forecast)
library(readr)
library(ggplot2)

energydata_complete <- read_csv("~/FinalProject2019/energydata_complete.csv")
appliances <- energydata_complete$Appliances[1:600]
temp_kitchen <- energydata_complete$T1[1:600]
temp_living <- energydata_complete$T2[1:600]
temp_office <- energydata_complete$T4[1:600]

appliances.ts <- ts(appliances, frequency = 144)
temp_kitchen.ts <- ts(temp_kitchen, frequency = 144)
temp_living.ts <- ts(temp_living, frequency = 144)
temp_office.ts <- ts(temp_office, frequency = 144)


VAR_data <- window(ts.union(appliances.ts,temp_kitchen.ts,temp_living.ts,temp_office.ts ))
VAR_est <- VAR(y = VAR_data, type = "both", lag.max = 20)

#var1 <- VAR(VAR_data, p=2, type="both")
forecast_result = c()
# for (i in c(1:10)){
#   appliances <- energydata_complete$Appliances[i:(600+i-1)]
#   temp_kitchen <- energydata_complete$T1[i:(600+i-1)]
#   temp_living <- energydata_complete$T2[i:(600+i-1)]
#   appliances.ts <- ts(appliances, frequency = 144)
#   temp_kitchen.ts <- ts(temp_kitchen, frequency = 144)
#   temp_living.ts <- ts(temp_living, frequency = 144)
#   VAR_data <- window(ts.union(appliances.ts,temp_kitchen.ts,temp_living.ts))
#   VAR_est <- VAR(y = VAR_data, type = "both", lag.max = 20)
#   forecast_value <- forecast(VAR_data, h = 1)
#   appliance_value <- forecast_value$forecast$appliances.ts$mean
#   forecast_result <- c(forecast_result, appliance_value)
#   
# }