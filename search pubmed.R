library ("plyr")
library ("ggplot2")
library ("reshape")
library ("xtable")
library("XML")
library("arules")
library("arulesViz")
library("stringr")
dd <- read.csv("pubmed_result", sep=",")
dd<-pubmed_result <- read.csv("~/Desktop/CoDe_R/pubmed_result.txt", sep=";")
str(dd)
#########################
#### Scrape function ####
#########################
scrape.pubmed <- function(x,y) {
  results <- pubmed_result[5]
  results <- results[results != "ShortDetails"]
  year <- str_extract(results, "(19[0-9]{2}|20[0-1][0-9])")
  count <- count(year[year < 2012])
  count$cat <- x
  count$type <- y
  return(count)
}

########################
#### scrape pubmed #####
########################

# read.delim is used on some files because the csv wouldn't be read
# correctly. Excel was used to save the csv-files as tab delim. files.

# "hepatitis C","injecting drug users")
pubmed_result <- read.delim("~/Desktop/CoDe_R/pubmed_result.txt",sep = ";")
data.long <- scrape.pubmed("hepc","injecting")

line.type <- c("hepatitis C" = "solid","injecting " = "longdash")
p <- ggplot(data.long, aes(x, freq)) + 
  geom_freqpoly() +scale_x_discrete(breaks = seq(1900,2011,5),+ 
                   limits=as.character(seq(1990,2021))) 
p  
(title="Number of PubMed hits per year and DSM-IV diagnosis",
       axis.text.x=theme_text(angle=45)) +
  xlab("Publication year") +
  ylab("Hits") +
  scale_linetype_manual("Disorder type", values=line.type)
################################################################################


####################scrapping de la colonne ...$ShortDetails = journal+années
pubmed_result
vars <- colsplit(pubmed_result$ShortDetails, "\\.", c("journal", "années"))
vars
###################-graphic#############################################################
ggplot(vars, aes(x = vars$années)) + geom_dotplot()+
  scale_y_continuous(name = "", breaks = NA)+
  theme_bw(base_size = 12, base_family = "")



