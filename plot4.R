setwd("~/Turkmen/exploratory_data_analysis/ExData_Plotting1")
hpc2<- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")
filt=which(as.Date(hpc2$Date,"%d/%m/%Y")==as.Date("2007-02-01","%Y-%m-%d"))
filt2=which(as.Date(hpc2$Date,"%d/%m/%Y")==as.Date("2007-02-02","%Y-%m-%d"))
fi=c(filt,filt2)
hpc_flt=hpc2[fi,]
hpc_flt$dt=strptime(paste(as.character(hpc_flt$Date),as.character(hpc_flt$Time),sep=" "),format="%d/%m/%Y %X");
hpc_flt$Global_active_power=as.numeric(as.character(hpc_flt$Global_active_power))
hpc_flt$Global_reactive_power=as.numeric(as.character(hpc_flt$Global_reactive_power))
hpc_flt$Voltage=as.numeric(as.character(hpc_flt$Voltage))
hpc_flt$Sub_metering_1=as.numeric(as.character(hpc_flt$Sub_metering_1))
hpc_flt$Sub_metering_2=as.numeric(as.character(hpc_flt$Sub_metering_2))
hpc_flt$Sub_metering_3=as.numeric(as.character(hpc_flt$Sub_metering_3))
png(filename="plot4.png", height=480, width=480,  units = "px",bg = "white");
par(mfrow=c(2,2),mar=c(4, 4, 2, 0.5))
plot(hpc_flt$dt,hpc_flt$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(hpc_flt$dt,hpc_flt$Voltage,type="l",ylab="Voltage",xlab="datetime")
yrange=range(hpc_flt$Sub_metering_1,hpc_flt$Sub_metering_2,hpc_flt$Sub_metering_3)
plot(hpc_flt$dt,hpc_flt$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(hpc_flt$dt,hpc_flt$Sub_metering_2,type="l",col="red")
lines(hpc_flt$dt,hpc_flt$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(3.5,3.5),col=c("black","red","blue"))
plot(hpc_flt$dt,hpc_flt$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off();