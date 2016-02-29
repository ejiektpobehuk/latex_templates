library(xtable)
library(Hmisc)

rm(list=ls(all=TRUE))

drawlogaxis <- function(side,range)
{
	par(tck=0.02)
#	d <- log(range,2)
	d <- range
	mlog <- floor(min(d))
	Mlog <- ceiling(max(d))
	SeqLog <- c(mlog:Mlog)
	Nlog <- (Mlog-mlog)+1
	axis(side,at=SeqLog,labels=2^SeqLog)
	ats <- log(seq(from=2,to=9,by=1),2)
	mod <- NULL
	for(i in SeqLog)
	{
		mod <- c(mod,rep(i,length(ats)))
	}
	ats <- rep(ats,Nlog)
	ats <- ats+mod
	par(tck=0.02/3)
	axis(side,at=ats,labels=NA)
}

logplot <- function(x,y,log='xy',...,forceylim=c(0,0),forcexlim=c(0,0))
{
	par(tck=0.02)
	xlg <- FALSE
	ylg <- FALSE
	if('x'%in%strsplit(log,'')[[1]]){x <- log(x,2);xlg=TRUE}
	if('y'%in%strsplit(log,'')[[1]]){y <- log(y,2);ylg=TRUE}
	yl <- ifelse(forceylim==c(0,0),range(y),forceylim)
	xl <- ifelse(forcexlim==c(0,0),range(x),forcexlim)
	plot(x,y,...,axes=FALSE,ylim=yl,xlim=xl)
	if(xlg){drawlogaxis(1,xl)}else{axis(1,at=pretty(xl),labels=pretty(xl))}
	if(ylg){drawlogaxis(2,yl)}else{axis(2,at=pretty(yl),labels=pretty(yl))}
	box()
}

addlog <- function(x,y,log='xy',...)
{
	xlg <- FALSE
	ylg <- FALSE
	if('x'%in%strsplit(log,'')[[1]]){x <- log(x,2);xlg=TRUE}
	if('y'%in%strsplit(log,'')[[1]]){y <- log(y,2);ylg=TRUE}
	points(x,y,...)

}

x <- 2^(4:17)
u_vh <- c(126, 132, 132, 130, 130, 124, 112, 112, 94, 94, 104, 94, 94, 80)
u_vyh <- c(0.084, 0.104, 0.162, 0.348, 0.760, 1.24, 1.68, 1.78, 1.84, 1.84, 1.78, 1.48, 1.24, 0.792)

#y <- 20*log(19.34,base=10)-10*log((1+x*x*144*10^(-10)),base=10)
y <- 20*log(19.34,base=10)-10*log((x*12*10^(-5)),base=10)

d <- data.frame(x, u_vh, u_vyh, u_vyh*1000/u_vh, 20*log(u_vyh*1000/u_vh,base=10))
#d[5,] <- paste("\\textbf{",d[5,],"}")
names(d) <- c("$f$, Гц",
"$U_{вх}$, мВ",
"$U_{вых}$, В",
"$K$",
"$L$, дБ")


print(xtable(d, digits=c(0,0,0,2,2,2), align=makeNstr("c|",ncol(d) + 1)),type="latex", file="d_2.tex",sanitize.colnames.function = identity,display="f", sanitize.text.function = identity, floating=FALSE,include.rownames=FALSE, hline.after=c(-1:nrow(d)))

pdf("d_2.pdf", family="NimbusSan", encoding="KOI8-R.enc", height=5)
logplot(x, 20*log(u_vyh*1000/u_vh,base=10), type="l", log="x", xlab="F, Гц", ylab="L, дБ")

#logplot(x, y)
abline(h=20*log(19.34,base=10), pch=22, lty=2)
dev.off()


#legend(2000,9.5, # places a legend at the appropriate place
#c("Health","Defense"), # puts text in the legend 

#lty=c(1,1), # gives the legend appropriate symbols (lines)

#lwd=c(2.5,2.5),col=c("blue","red")) # gives the legend lines the correct color and width

