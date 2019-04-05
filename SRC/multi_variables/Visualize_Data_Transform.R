library(vars)
library(forecast)
library(readr)
library(ggplot2)
library(astsa)

energydata_complete <- read_csv("~/FinalProject2019/energydata_complete.csv")
appliances <- energydata_complete$Appliances[1:874]
humid <- energydata_complete$RH_1[1:874]
lights <- energydata_complete$lights[1:874]
temp_kitchen <- energydata_complete$T1[1:874]
temp_living <- energydata_complete$T2[1:874]
temp_office <- energydata_complete$T4[1:874]
speed <- energydata_complete$Windspeed[1:874]

appliances.ts <- ts(appliances, frequency = 144)
humid.ts <- ts(humid, frequency = 144)
appliances_diff1 <- diff(appliances.ts, lag = 1)
tm <- cbind(appliances.ts, appliances_diff1)



#light.ts <- ts(lights , frequency = 144)
temp_kitchen.ts <- ts(temp_kitchen, frequency = 144)
temp_kitchen_lag <- diff(temp_kitchen.ts, lag = 1)
tm_temp_kitchen <-cbind(temp_kitchen.ts, temp_kitchen_lag)

temp_living.ts <- ts(temp_living, frequency = 144)
temp_living_lag <- diff(temp_living.ts, lag = 1)
tm_temp_living <-cbind(temp_living.ts, temp_living_lag)

temp_office.ts <- ts(temp_office, frequency = 144)
temp_office_lag <- diff(temp_office.ts, lag = 1)
tm_temp_office <-cbind(temp_office.ts, temp_office_lag)

speed.ts <- ts(speed, frequency = 144)

VAR_data <- window(ts.union(appliances.ts,temp_office.ts ))
VAR_est <- VAR(y = VAR_data, type = "both", lag= 3)


