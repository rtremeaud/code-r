library(RJSONIO)
library(googleVis)
data(Fruits)
Fruits
M <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
plot(M)
df <- data.frame(country=c("US", "GB", "BR"), 
                 val1=c(1,3,4), val2=c(23,12,32))
Line<-gvisLineChart(df, xvar="country", yvar=c("val1","val2"),
                    options=list( title="Hello World", titleTextStyle="{color:'red',
fontName:'Courier',fontSize:16}", backgroundColor="#D3D3D3",
                                  vAxis="{gridlines:{color:'black', count:3}}", hAxis="{title:'Country', titleTextStyle:{color:'blue'}}", series="[{color:'green', targetAxisIndex: 0},
{color: 'orange',targetAxisIndex:1}]", vAxes="[{title:'val1'}, {title:'val2'}]", legend="bottom", curveType="function",
                                  width=500, height=300))
plot(Line)+plot(Line)

Editor <- gvisLineChart(df, options=list(gvis.editor='Edit me!'))
plot(Editor)
df <- data.frame(country=c("US", "GB", "BR"), 
                 val1=c(1,3,4), 
                 val2=c(23,12,32))

## Bar chart
Bar1 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"))
plot(Bar1)