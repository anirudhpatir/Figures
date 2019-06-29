library(gridExtra)

ColoRMap = function(n,d,pal=NULL){
  d = as.numeric(unlist(d))
  if(is.null(pal)){
    clrfun = colorRamp(rev(brewer.pal(11,'Spectral')))
  }
  else{
    clrfun = colorRamp(pal)
  }
  y = clrfun(ecdf(d)(seq(min(d),max(d),length.out = n)))
  z = rgb(y, maxColorValue = 255)
  return(z)
}

ColoRMapPlot = function(x,pal){

  z <- density(x, n = 2^12)
  a1 = ggplot(data.frame(x = z$x, y = z$y), aes(x, y)) + geom_line() + 
    geom_segment(aes(xend = x, yend = 0, colour = x)) + 
    scale_color_gradientn(colours = pal)+
    labs(y = "Density",x = "Value",color = "")+
    theme_classic()
  a2 = ggplot(data.frame(x = 1:length(x), y = sort(x)), aes(x, y,color = y)) + 
    geom_point() + 
    scale_color_gradientn(colours = pal)+
    labs(y = "Value",x = "Index", color = "")+
    theme_classic()
  grid.arrange(a1,a2)
  
}
