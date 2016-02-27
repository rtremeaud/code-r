#Je me demande si on peut regarder ce que fait Nadine sur twitter ....
reqURL <- "https://api.twitter.com/oauth/request_token" 
accessURL <- "http://api.twitter.com/oauth/access_token" 
authURL <- "http://api.twitter.com/oauth/authorize" 
consumerKey <- "12345pqrst6789ABCD" 
consumerSecret <- "abcd1234EFGH5678ijkl0987MNOP6543qrst21" 
twitCred <- OAuthFactory$new(consumerKey=consumerKey,
consumerSecret=consumerSecret, requestURL=reqURL, accessURL=accessURL, authURL=authURL)