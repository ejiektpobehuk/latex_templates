library(xtable)
library(Hmisc)

rm(list=ls(all=TRUE))

u_vh <- c(0.188, 0.154, 0.130, 0.110, 0.088, 0.116, 0.158, 0.138,0.064,0.080,0.051)
u_vyh <- c(4.52, 4.04, 3.16, 2.48, 1.88, 3.04, 4.00, 3.52, 0.608, 1.37, 0.392)
u_vyh <- u_vyh[order(u_vh)]
u_vh <- u_vh[order(u_vh)]
k <- u_vyh/u_vh
u_vyh_teor <- 19.34*u_vh

d <- data.frame(u_vh, u_vyh, u_vyh_teor, k)
#d[5,] <- paste("\\textbf{",d[5,],"}")
names(d) <- c("$U_{вх}$, В",
"$U_{вых}$, В",
"$U_{вых.теор}, В$",
"$K$")

print(xtable(d, digits=c(0,3,2,2,2), align=makeNstr("c|",ncol(d) + 1)),type="latex", file="d_1.tex",sanitize.colnames.function = identity,display="f", sanitize.text.function = identity, floating=FALSE,include.rownames=FALSE, hline.after=c(-1:nrow(d)))

pdf("d_1.pdf", family="NimbusSan", encoding="KOI8-R.enc")
plot(u_vh, u_vyh, type="l", ylim=c(0,5), yaxs="i", xaxs="i", xlim=c(0,0.2), xlab="Uвх,В", ylab="Uвых,В")
lines(u_vh, u_vyh_teor, pch=22, lty=2)
legend(0.14, 1, # places a legend at the appropriate place
c("Эксперимент","Формула"), # puts text in the legend 
lty=c(1,2), # gives the legend appropriate symbols (lines)
lwd=c(2.5,2.5)) # gives the legend lines the correct color and width

#plot(t_i, t_f, type="l", main="Заголовок")
dev.off()
#embedFonts("d_1.pdf")

