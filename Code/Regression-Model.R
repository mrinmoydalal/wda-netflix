


#################################################################################################################
# t-test for seeing difference in rotten tomatoes rating between competitors
competitor_data<-read.csv("Competitor_Data.csv", sep=",", header=T)
netflix_exclusive<-subset(competitor_data,Netflix==1 & num_platforms==0)
disney_exclusive<-subset(competitor_data,Netflix==0 & Disney.==1 & Hulu==0 & Prime.Video==0)
t.test(disney_exclusive$Rotten_Tomatoes_Proper,netflix_exclusive$Rotten_Tomatoes_Proper,alternative='less')

############################################################################################################
# t-test for seeing difference in seasons - ie 1 season vs more than 1 season
seasons_distribution<-read.csv("seasons_distribution.csv", sep=",", header=T)
one_season<-subset(seasons_distribution,One.season=='1')
multiple_seasons<-subset(seasons_distribution,One.season!='1')
t.test(one_season$Rotten_Tomatoes_Proper,multiple_seasons$Rotten_Tomatoes_Proper,alternative='less')


########################################################################################################
# t-test for seeing difference in correlation between tv shows, movie and subscriber count
netflix_data <- read.csv("regression_dataset.csv", sep=",", header=T)
correlation_sample<-subset(netflix_data,Year>=2014)
n<-nrow(correlation_sample)
correl_tvshow<-cor(correlation_sample$Number.of.Subscribers,correlation_sample$Overall.TV.Shows)
correl_movie<-cor(correlation_sample$Number.of.Subscribers,correlation_sample$Overall_Movies)

#t-value for tv-show correlation- link to documentation- https://www.rdocumentation.org/packages/psych/versions/2.2.9/topics/r.test
t_tvshow<-correl_tvshow*sqrt(n-2)/sqrt(1-(correl_tvshow^2))
t_movie<-correl_movie*sqrt(n-2)/sqrt(1-(correl_movie^2))

#p-value for tv, movie
p_tv<-2*pt(t_tvshow,df=n-2,lower.tail=FALSE)
p_movie<-2*pt(t_movie,df=n-2,lower.tail=FALSE)
p_tv
p_movie


##########################################################################################################
# Building linear Model
netflix_data <- read.csv("regression_dataset.csv", sep=",", header=T)
hist(netflix_data$Number.of.Subscribers)
hist(log(netflix_data$Number.of.Subscribers))
hist(netflix_data$Overall_Movies)
hist(netflix_data$Overall.TV.Shows)
model <- lm(log(Number.of.Subscribers) ~ Overall_Movies+Overall.TV.Shows+
                                        audience_score_tv+tomato_score_tv+audience_score_movies+tomato_score_movies
                                        +Average.of.Compounded.Review.Score, data = netflix_data)
summary(model)
