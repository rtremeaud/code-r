library(XML)
xml.url<-"~/Desktop/R_XML/prop.xml"
xmlfile <- xmlParse(xml.url,useInternalNodes= TRUE)
xmltop = xmlRoot(xmlfile)
print(xmltop)[1:2]
plantcat <- xmlSApply(xmltop, function(x) xmlSApply(x, xmlValue))
plantcat_df <- data.frame(t(plantcat),row.names=NULL)
plantcat_df[1:5,1:4]

xmlName(xmltop)
xmlValue(xmlfile[["//lastname"]])
