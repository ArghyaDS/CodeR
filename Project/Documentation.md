# Introduction

Twitter is an online news and social networking service that enables users to send and read short 140-character messages called "tweets". Registered users can read and post tweets, but those who are unregistered can only read them. Hence, Twitter is a public platform with a mine of public opinion of people all over the world and of all age categories.  As of October 2016, Twitter has more than 315 million monthly active users. Twitter Sentiment Analysis is the process of determining the emotional tone behind a series of words, used to gain an understanding of the attitudes, opinions and emotions expressed within an online mention. Tweets are imported using R and the data is cleaned by removing irrelevant elements such as punctuation marks, blank spaces, hash-tags, usernames, and URLs. Lexical Analysis is used to predict the sentiment of tweets and subsequently the opinions are plotted through ggplot and wordcloud function.

# Sentiment Analysis and Data Visualization

Sentiment Analysis examines the problem of studying texts, like posts and reviews, uploaded by users on microblogging platforms, forums, and electronic businesses, regarding the opinions they have about a product, service, event, person or idea. The most common use of Sentiment Analysis is to classify a text to a class. Depending on the dataset and the reason, Sentiment Classification can be binary (positive or negative) or multi-class (3 or more classes) problem. In addition, among researchers and stakeholders, either similar or completely different opinions can be found concerning the relation between emotion detection and sentiment analysis, depending on their perspective. However, regardless the result or approach, they all adopt the same techniques.

# Sentiment Analysis Approaches and Its Benefits

The applications for sentiment analysis are endless. It is extremely useful in social media monitoring as it allows us to gain an overview of the wider public opinion behind certain topics However, it is also practical for use in business analytics and situations in which text needs to be analysed. Sentiment analysis is in demand because of its efficiency. Thousands of text documents can be processed for sentiment in seconds, compared to the hours it would take a team of people to manually complete. Because it is so efficient (and accurate – Semantic has 80% accuracy for English content) many businesses are adopting text and sentiment analysis and incorporating it into their processes. Applications: The applications of sentiment analysis are broad and powerful. Shifts in sentiment on social media have been shown to correlate with shifts in the stock market.  

For example, the Obama administration used sentiment analysis to gauge public opinion to policy announcements and campaign messages ahead of 2012 presidential election. The ability to quickly understand consumer attitudes and react accordingly is something that Expedia Canada took advantage of when they noticed that there was a steady increase in negative feedback to the music used in one of their television adverts. 

Sentiment Analysis can be executed using two major approaches. Such as; Machine Learning: This approach uses a machine-learning technique and diverse features to construct a classifier that can identify text that expresses sentiment. Nowadays, deep-learning methods are popular because they fit on data learning representations.

Lexicon-Based: This method uses a variety of words annotated by polarity score, to decide the general assessment score of a given content. The strongest asset of this technique is that it does not require any training data, while its weakest point is that a large number of words and expressions are not included in sentiment lexicons.

In this study, I have chosen the lexicon-based analytics to obtain data visualization outcomes to represent the sentiments of chosen movie tweets.

# Overview of the Implementation

## Collection of Data and Prerequisites

Twitter Authentication to access API is obtained through developer twitter account. In order to execute the provided source code in appendix, developer account and sentiment analysis application is required. Developer account provides access over four credentials such as Consumer_key, Consumer_secret, Access_token, and Access_secret. Tweets are extracted using twitter application created in twitter interface. In R studio, “twitteR” library provides an interface to the Twitter web API and “ROAuth” library provides R Interface for authorization with using Consumer_key, Consumer_secret, Access_token, and Access_secret.

## Cleaning Data and Pre-processing

In order to perform data pre-processing, the following aspects are considered to reduce the discrepancies from the sentiment analysis work.

* Extra punctuation marks
* Redundant Blank spaces
* Usernames
* Hash-tags
* Stop words
* URLS

*Lexical Analysis:* I have used uni-gram comparison to the pre-loaded text database, the tweets are assigned over sentiment score – positive or negative and overall score is calculated. I have presented the scores and the tweets with word cloud and column chart for better visualization.

## Visualization (Word cloud)

<img src="Project/Rplots_WC.jpg">

## Main Packages used

*twitteR:* Provides an interface to the Twitter web API 

*stringr:* String operations in R 

*ROAuth:* Provides an interface to the OAuth 1.0 specification allowing users to authenticate via OAuth to the server of their choice. 

*ggplot2:* An implementation of the grammar of graphics in R. It combines the advantages of both base and lattice graphics: conditioning and shared axes are handled automatically, and you can still build up a plot step by step from multiple data sources. 

*tm:* A framework for text mining applications within R.

## Limitations and Future Work

Some limitations exist in this work; mentioned as following:

* The Twitter Search API can get tweets up to a maximum of 7 days old.  
* It cannot get 100% efficiency in analysing sentiment of tweets. 
* Detect sarcasm in tweets 
* Analyse images for emotions   
* Find number of mentions of a particular organizations

# Conclusion

Data visualization is the presentation of data in a pictorial or graphical format. It enables decision makers to see analytics presented visually, so they can grasp difficult concepts or identify new patterns. With interactive visualization, you can take the concept a step further by using technology to drill down into charts and graphs for more detail, interactively changing what data you see and how it’s processed. Tables, bar plots, histograms and pie charts can be used for visualization. I have presented the implementation over visualization so that collected primary data could be viewed along with its values.

# Acknowledgements

* Anandarajan, M., Hill, C. and Nolan, T., 2019. Sentiment Analysis of Movie Reviews Using R. In Practical Text Analytics(pp. 193-220). Springer, Cham.
* Jagdale, R.S., Shirsat, V.S. and Deshmukh, S.N., 2019. Sentiment analysis on product reviews using machine learning techniques. In Cognitive Informatics and Soft Computing (pp. 639-647). Springer, Singapore.
* Redhu, S., Srivastava, S., Bansal, B. and Gupta, G., 2018. Sentiment Analysis Using Text Mining: A Review. International Journal on Data Science and Technology, 4(2), p.49.
* Satija, T. and Thareja, R., 2018. Sentiment Analysis Using Twitter Mining in R Language.
