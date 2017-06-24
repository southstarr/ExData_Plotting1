# This code is part of the Assignment of Week 1 of the Coursera
# course "Exploratory Data Analysis"

# The below R code generates "plot3.png"

# Input the Data 
data_plot3 <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

# Subsetting rows corresponding to the needed dates
data3 <- data_plot3[data_plot3$Date %in% c("1/2/2007","2/2/2007"),]

# Removing the rows where there are missing values
data3[data3 == "?"] <- NA
data3 <- data3[complete.cases(data3),]  

# Converting character vectors to numeric
data3$Sub_metering_1 <- as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2 <- as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3 <- as.numeric(data3$Sub_metering_3)


# Opening a png graphics device
png(
  "plot3.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

# Plotting line graph of three sub metering columns in the same figure
plot(data3$Sub_metering_1,type = "l",xaxt = "n",xlab = "",ylab = "")
lines(data3$Sub_metering_2,col = "red")
lines(data3$Sub_metering_3,col = "blue")

# Adding the legend at the top right 
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue"),lty = c(1,1,1),y.intersp = 0.8)

# Adding the label on y-axis
title(ylab = "Energy sub metering")

# Adding the labels on x-axis
len_vec <- nrow(data3)
axis(1, at = c(1,len_vec/2,len_vec),labels = c("Thu","Fri","Sat"))

# Closing the png graphics device
dev.off()





