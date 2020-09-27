#rm(list=ls()) 
data1<-read.delim("household.txt",sep = ";")

s<-split(data1,data1$Date)

a1<-s$`1/2/2007`
a1<-transform(a1, Date=as.Date(Date))

a2<-s$`2/2/2007`
a2<-transform(a2, Date=as.Date(Date))

data2<-a1

dates<-as.character(data2$Date)
times<-as.character(data2$Time)
data2$Date.time<-paste(dates,times,sep = " ")
timetoplot<-strptime(data2$Date.time, format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height = 480)
plot(timetoplot,as.numeric(data2$Sub_metering_1), type="l",xlab="",ylab="Energy sub metering")
lines(timetoplot,as.numeric(data2$Sub_metering_2), col="red")
lines(timetoplot,as.numeric(data2$Sub_metering_3), col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")
dev.off()