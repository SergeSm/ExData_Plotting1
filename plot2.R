library(dplyr)
library(lubridate)

dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

dts <- dt %>% filter(dmy(Date) %in% c(ymd("2007-02-01"), ymd("2007-02-02"))) %>%
    mutate(DT =  as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

rm(dt)

#2
plot(dts$DT, dts$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
