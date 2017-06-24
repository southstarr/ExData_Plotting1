# This code is part of the Assignment of Week 1 of the Coursera
# course "Exploratory Data Analysis"

# The below R code generates "plot2.png"

# Input the Data 
data_plot2 <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

# Subsetting rows corresponding to the needed dates
data2 <- data_plot2[data_plot2$Date %in% c("1/2/2007","2/2/2007"),]

# Removing rows where Global_active_power values are missing
data2[data2$Global_active_power == "?"] <- NA
data2 <- data2[complete.cases(data2$Global_active_power),]  

# COnverting the character vector to numeric type
data2$Global_active_power <- as.numeric(data2$Global_active_power)


data2$Date_informat <- strptime(paste(data2$Date,data2$Time),
                                      format = "%d/%m/%Y %H:%M:%S")

# Opening a png graphics device
png(
  "plot2.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

#Plotting line graph of the Global Active Power vector
plot(data2$Date_informat,data2$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# Closing the png graphics device
dev.off()





