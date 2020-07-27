rm(list = ls())
setwd("C:/Users/pkansal/OneDrive - Capgemini/Desktop/Coursera work/exdata_data_household_power_consumption")

df <- read.table("household_power_consumption.txt",header = T,sep = ";")
df$Time <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

df1 <- df[(df$Date >= "2007-02-01") & (df$Date <= "2007-02-02"),]
summary(df1)

num_col <- names(df1)[!names(df1) %in% c("Date","Time")]
for(i in num_col)
  df1[[i]] <- as.numeric(df1[[i]])


## plot1 ##
png("plot1.png")
hist(df1$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power")
dev.off()