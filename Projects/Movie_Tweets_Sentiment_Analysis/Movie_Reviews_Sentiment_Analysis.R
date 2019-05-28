library("NLP")
library("twitteR")
library("syuzhet")
library("tm")
library("SnowballC")
library("stringi")
library("topicmodels")
library("syuzhet")
library("twitteR")
library("ROAuth")

consumer_key <- "<Enter consumer_key>" 
consumer_secret <- "<Enter consumer_secret>" 
access_token <- "<Enter access_token>" 
access_secret <- "<Enter access_secret>"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweets_cm <- searchTwitter("#captainmarvel", n=1000,lang = "en")
tweets_aq <- searchTwitter("#aquaman", n=1000,lang = "en")
tweets_ww <- searchTwitter("#wonderwoman", n=1000, lang = "en")
tweets_bp <- searchTwitter("#blackpanther", n=1000, lang = "en")

cm_tweets <- twListToDF(tweets_cm)
aq_tweets <- twListToDF(tweets_aq)
ww_tweets <- twListToDF(tweets_ww)
bp_tweets <- twListToDF(tweets_bp)

View(cm_tweets)
View(aq_tweets)
View(ww_tweets)
View(bp_tweets)

cm_text<- cm_tweets$text
aq_text<- aq_tweets$text
ww_text<- ww_tweets$text
bp_text<- bp_tweets$text

# Convert all text to lower case
cm_text<- tolower(cm_text)
aq_text<- tolower(aq_text)
ww_text<- tolower(ww_text)
bp_text<- tolower(bp_text)

# Replace blank space ("rt")
cm_text <- gsub("rt", "", cm_text)
aq_text <- gsub("rt", "", aq_text)
ww_text <- gsub("rt", "", ww_text)
bp_text <- gsub("rt", "", bp_text)

# Remove the URLs
cm_text <- gsub("http.*","", cm_text)
cm_text <- gsub("https.*","", cm_text)
aq_text <- gsub("http.*","", aq_text)
aq_text <- gsub("https.*","", aq_text)
ww_text <- gsub("http.*","", ww_text)
ww_text <- gsub("https.*","", ww_text)
bp_text <- gsub("http.*","", bp_text)
bp_text <- gsub("https.*","", bp_text)

# Remove the hash-tags
cm_text <- gsub("#.*","", cm_text)
aq_text <- gsub("#.*","", aq_text)
ww_text <- gsub("#.*","", ww_text)
bp_text <- gsub("#.*","", bp_text)

# Replace @UserName
cm_text <- gsub("@\\w+", "", cm_text)
aq_text <- gsub("@\\w+", "", aq_text)
ww_text <- gsub("@\\w+", "", ww_text)
bp_text <- gsub("@\\w+", "", bp_text)

# Remove punctuation
cm_text <- gsub("[[:punct:]]", "", cm_text)
aq_text <- gsub("[[:punct:]]", "", aq_text)
ww_text <- gsub("[[:punct:]]", "", ww_text)
bp_text <- gsub("[[:punct:]]", "", bp_text)

# Remove tabs
cm_text <- gsub("[ |\t]{2,}", "", cm_text)
aq_text <- gsub("[ |\t]{2,}", "", aq_text)
ww_text <- gsub("[ |\t]{2,}", "", ww_text)
bp_text <- gsub("[ |\t]{2,}", "", bp_text)

# Remove blank spaces at the beginning
cm_text <- gsub("^ ", "", cm_text)
aq_text <- gsub("^ ", "", aq_text)
ww_text <- gsub("^ ", "", ww_text)
bp_text <- gsub("^ ", "", bp_text)

# Remove blank spaces at the end
cm_text <- gsub(" $", "", cm_text)
aq_text <- gsub(" $", "", aq_text)
ww_text <- gsub(" $", "", ww_text)
bp_text <- gsub(" $", "", bp_text)

library("wordcloud")
#generate wordcloud
wordcloud(cm_tweets$text,min.freq = 10,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 500)
wordcloud(aq_tweets$text,min.freq = 10,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 500)
wordcloud(ww_tweets$text,min.freq = 10,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 500)
wordcloud(bp_tweets$text,min.freq = 10,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 500)

#getting emotions using in-built function
mysentiment_cm<-get_nrc_sentiment((cm_text))
mysentiment_aq<-get_nrc_sentiment((aq_text))
mysentiment_ww<-get_nrc_sentiment((ww_text))
mysentiment_bp<-get_nrc_sentiment((bp_text))

#calculationg total score for each sentiment
Sentimentscores_cm<-data.frame(colSums(mysentiment_cm[,]))
Sentimentscores_aq<-data.frame(colSums(mysentiment_aq[,]))
Sentimentscores_ww<-data.frame(colSums(mysentiment_ww[,]))
Sentimentscores_bp<-data.frame(colSums(mysentiment_bp[,]))

names(Sentimentscores_cm)<-"Score"
Sentimentscores_cm<-cbind("sentiment"=rownames(Sentimentscores_cm),Sentimentscores_cm)
rownames(Sentimentscores_cm)<-NULL

names(Sentimentscores_aq)<-"Score"
Sentimentscores_aq<-cbind("sentiment"=rownames(Sentimentscores_aq),Sentimentscores_aq)
rownames(Sentimentscores_aq)<-NULL

names(Sentimentscores_ww)<-"Score"
Sentimentscores_ww<-cbind("sentiment"=rownames(Sentimentscores_ww),Sentimentscores_ww)
rownames(Sentimentscores_ww)<-NULL

names(Sentimentscores_bp)<-"Score"
Sentimentscores_bp<-cbind("sentiment"=rownames(Sentimentscores_bp),Sentimentscores_bp)
rownames(Sentimentscores_bp)<-NULL

#*************************************************************************************

#plotting the sentiments with scores
library("ggplot2")
ggplot(data=Sentimentscores_cm,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments on Captain Marvel Movie Tweets")


ggplot(data=Sentimentscores_aq,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
theme(legend.position="none")+
  xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments on Aquaman Movie Tweets")


ggplot(data=Sentimentscores_ww,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
theme(legend.position="none")+
  xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments on Wonder Woman Movie Tweets")


ggplot(data=Sentimentscores_bp,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
theme(legend.position="none")+
  xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments on Black Panther Movie Tweets")

