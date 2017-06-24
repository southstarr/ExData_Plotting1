# This code is part of the Assignment of Week 1 of the Coursera
# course "Exploratory Data Analysis"

# The below R code generates "plot1.png"

# Input the Data 
data_plot1 <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

# Subsetting rows corresponding to the needed dates 
data1 <- data_plot1[data_plot1$Date %in% c("1/2/2007","2/2/2007"),]

# Removing the rows where Global_active_power values are missing
data1[data1$Global_active_power == "?"] <- NA
data1 <- data1[complete.cases(data1$Global_active_power),]  

# COnverting the character vector to numeric type
data1$Global_active_power <- as.numeric(data1$Global_active_power)


# Opening a png graphics device with specified file name "plot1.png"
png(
  "plot1.png",
   width     = 480,
   height    = 480,
   units     = "px"
)

# Generating a histogram with needed titles and axis labels
hist(data1$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     breaks = 12)

# Closing the device
dev.off()





