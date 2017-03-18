library(dplyr)
library(lubridate)

dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

dts <- dt %>% filter(dmy(Date) %in% c(ymd("2007-02-01"), ymd("2007-02-02"))) %>%
    mutate(DT =  as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

rm(dt)

# 1
hist(dts$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
