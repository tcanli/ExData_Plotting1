setwd("~/Turkmen/exploratory_data_analysis/ExData_Plotting1")
hpc2<- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")
filt=which(as.Date(hpc2$Date,"%d/%m/%Y")==as.Date("2007-02-01","%Y-%m-%d"))
filt2=which(as.Date(hpc2$Date,"%d/%m/%Y")==as.Date("2007-02-02","%Y-%m-%d"))
fi=c(filt,filt2)
hpc_flt=hpc2[fi,]
hpc_flt$dt=strptime(paste(as.character(hpc_flt$Date),as.character(hpc_flt$Time),sep=" "),format="%d/%m/%Y %X");
hpc_flt$Global_active_power=as.numeric(as.character(hpc_flt$Global_active_power))
png(filename="plot2.png", height=480, width=480,  units = "px",bg = "white");
plot(hpc_flt$dt,hpc_flt$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off();