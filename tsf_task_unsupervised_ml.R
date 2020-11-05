# importing dataset
# you can find the data set at https://bit.ly/3kXTdox
dataset = read.csv('tsf_taskunsupervised_ml.csv')

#removing the columns we don't need like column 1 and 6 are not necessary 
dataset = dataset[2:5]

# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'c',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
#remember wherever there is bend i.e elbow formation in our plot at that point the no on x-axis is our no. of centers.


# Fitting K-Means to the dataset
set.seed(29)
kmeans <- kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster


# Visualising the clusters
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of iris'),
         xlab = 'no of clusters',
         ylab = 'wcss')
