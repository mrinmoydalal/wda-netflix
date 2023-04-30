# wda-netflix
Analysis on Netflix Shows


#################################### Step 1.1 ####################################

# Web scraping- Customer Reviews
# Notebook Name: WDA Project Web Scraping.ipynb (Python Notebook Execution)
# Pre-Required Dataset: netflix_dataset.csv
# Libraries Used: Beautiful Soup, Selenium

Procedure:
1. Read the netflix_dataset.csv file 
2. Run the ipynb file to scrape the reviews from rotten tomatoes website

Output file- RottenTomatoesReviews.csv

#################################### Step 1.2 ####################################

# Obtaining Customer Sentiment from the reviews
# Notebook Name: Project Sentiment Analysis.ipynb
# Pre-Required Dataset: RottenTomatoesReviews.csv
# Libraries Used: NLTK, WordNetLemmatizer, vader_lexicon
Procedure:
1. Run the file to obtain sentiment analysis output file- sentimentanalysis.csv


#################################### Step 1.3 ####################################
# Obtaining Customer Sentiment for each content
# Pre-required Dataset- sentimentanalysis.csv

Procedure:
1. Export the sentimentanalysis.csv file as excel file.
2. Select all the columns in the excel worksheet and go to Insert -> Pivot Table -> From Table/Range. 
3. In the pivot table fields select ‘Title’. Drag ‘Compounded Review Score’, ‘Positive Review Score’, ‘Negative Review Score’, ‘Neutral Review Score into the aggregation column and in value field settings select ‘Average’
4. Copy the pivot table into a new excel file and name it as ‘Final Sent.xlsx
5. Similarly follow step 3 to create another pivot table and instead of ‘Title’ select ‘Type’ and drag ‘Compounded Review Score’, ‘Positive Review Score’, ‘Negative Review Score’, ‘Neutral Review Score into the aggregation column and in value field settings select ‘Average’.


Output File- sentimentanalysis.xlsx 

#################################### Step 2.1 ####################################

# Obtaining Rotten tomatoes score and user ratings from rotten tomato
# Notebook Name: Rotten Tomatoes Scrapper.ipynb

# Libraries Used: selenium, random, time, requests, json, bs4, re, urllib.request, urllib.error, urllib.parse
# Pre-Required Dataset: netflix_dataset.csv

Procedure:
1. Run the file to obtain sentiment analysis output file- final_netflix.csv

#################################### Step 3 ####################################

# Analysis and Dataset Building
# Notebook Name: WDA_Final_Project_Regression.ipynb (Python Notebook Execution)
# Libraries Used: Pandas (pip install pandas), Numpy(pip install numpy)
# Pre-Required Datasets:
1. netflix_dataset.csv- contains the main data about the tv shows and movies. (Downloaded from kaggle- https://www.kaggle.com/datasets/shivamb/netflix-shows)
2. All Netflix Originals.csv- contains data on original content from netflix - (Downloaded from https://www.imdb.com/list/ls093971121/)
3. Movies_on_Netflix__Prime_Video__Hulu_and_Disney__1579_91.csv- contains movies that are present in netflix, other platforms -(https://raw.githubusercontent.com/prasertcbs/basic-dataset/master/MoviesOnStreamingPlatforms_updated.csv)
4. tv_shows.csv- contains tv shows that are present in netflix, other platforms (Downloaded from kaggle- https://www.kaggle.com/datasets/ruchi798/tv-shows-on-netflix-prime-video-hulu-and-disney)
5. Subscriber Data.xlsx- (obtained from https://www.businessofapps.com/data/netflix-statistics/- Under section-Netflix Subscribers)
6. Final Sent.xlsx- gives the sentiment score for each movie and tv show
7. final_netflix.csv

Procedure:
1. Please make note of file locations- change as per needed while reading the above files 
2. Run the notebook upon getting the pre-required datasets

Output files(csv) - 
Regression_Dataset.csv, Competitor_Data.csv, seasons_distribution.csv

#################################### Step 4 ####################################

# T-Tests and Regression Results 
Regression-Model.R (R-File)
1. Set working directory to the place where output of ipynb files are present.
2. Run the WDA_Final_Project_Regression.ipynb notebook before starting the execution of R file
3. Run the R-file to obtain the results for t-tests and coefficients for linear model
