# Figures
The function maps a colour palette to a non linear distribution

## ColouRMap    
### Input:  
n = number of colours to output   
val = the values on which to map (vector, matrix, dataframe)  
pal = a palette (default is spectral)  
  
### Ouput:  
vector of colours in Hex  

## ColouRMapPlot 
### Dependencies:  
ggplot, gridExtra, RColorBrewer
  
### Input:  
val = distribution (vector, matrix, dataframe)  
pal = a palette (default is spectral)  
  
### Output:  
plot palette mapped on density and values of data

## Example
#Data 1   
x1 = rnbinom(1000, 10, .5)  
x2 = rnbinom(1000,50,.5)  
x = c(x1,x2) 

y = ColoRMap(n = 200, val = x)  
ColoRMapPlot(val = x, pal = y)  

![](image.png)
