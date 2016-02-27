library(ggplot2)
library(twitteR)
library(stringr)
library(wordcloud)
# harvest tweets from each user
epa_tweets = userTimeline("EPAgov", n=500)
nih_tweets = userTimeline("NIHforHealth", n=500)
cdc_tweets = userTimeline("CDCgov", n=500)

# dump tweets information into data frames
epa_df = twListToDF(epa_tweets)
nih_df = twListToDF(nih_tweets)
cdc_df = twListToDF(cdc_tweets)