library(gridExtra)
library(RColorBrewer)
library(ggplot2)

ColoRMap = function(n,val,pal=NULL){
  val = as.numeric(unlist(val))
  if(is.null(pal)){
    clrfun = colorRamp(rev(brewer.pal(11,'Spectral')))
  }
  else{
    clrfun = colorRamp(pal)
  }
  y = clrfun(ecdf(val)(seq(min(val),max(val),length.out = n)))
  z = rgb(y, maxColorValue = 255)
  return(z)
}

ColoRMapPlot = function(val,pal){
  z <- density(val, n = 2^12)
  a1 = ggplot(data.frame(x = 1:length(val), y = sort(val)), aes(x, y,color = y)) + 
    geom_point() + 
    scale_color_gradientn(colours = pal)+
    labs(y = "Value",x = "Index", color = "")+
    theme_classic()
  a2 = ggplot(data.frame(x = z$x, y = z$y), aes(x, y)) + geom_line() + 
    geom_segment(aes(xend = x, yend = 0, colour = x)) + 
    scale_color_gradientn(colours = pal)+
    labs(y = "Density",x = "Value",color = "")+
    theme_classic()
  grid.arrange(a1,a2)
}
