#rm(list=ls()) 
data1<-read.delim("household.txt",sep = ";")

s<-split(data1,data1$Date)

a1<-s$`1/2/2007`
a1<-transform(a1, Date=as.Date(Date))

a2<-s$`2/2/2007`
a2<-transform(a2, Date=as.Date(Date))
#a2<-transform(a2, Time=strptime(Time,format = "%Y-%m-%d %H:%M:%S"))
#a2<-matrix(a2[!is.na(a2)],1140,9)

data2<-a1

dates<-as.character(data2$Date)
times<-as.character(data2$Time)
data2$Date.time<-paste(dates,times,sep = " ")
timetoplot<-strptime(data2$Date.time, format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height = 480)
plot(timetoplot,as.numeric(data2$Global_active_power), type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
