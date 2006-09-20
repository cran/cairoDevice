library(cairoDevice)
mg <- function(n) {
     offx<-c(0,1,1,0, NA)
     offy<-c(0,0,1,1, NA)
     list(x = rep(1:n, each = 5 * n) + offx,
          y = rep(rep(1:n, n), each = 5) + offy)
}

g <- function(col = "red", border = NA, n = 9, ...) {
     g <- mg(n)
     plot(1:(n+1),1:(n+1),type="n")
     polygon(g$x,g$y,col=col,border=border, ...)
}

withPDF14 <- function(expr, file) {
     pdf(file = file, version="1.4")
     tryCatch(expr, finally = dev.off())
} 

Cairo()
g(rgb(1,0,0,0.5), NA)
g(rgb(1,0,0,0.5),rgb(1,0,0,0.25))
dev.off()

#pdf
withPDF14(g(rgb(1,0,0,0.5), NA),"tmp1.pdf")
withPDF14(g(rgb(1,0,0,0.5), rgb(1,0,0,0.25)),"tmp2.pdf")
withPDF14(g(rgb(1,0,0,0.5), NA, lty = 0),"tmp3.pdf")
withPDF14(g(rgb(1,0,0,0.5), rgb(1,0,0,0.25), lty = 0),"tmp4.pdf") 
