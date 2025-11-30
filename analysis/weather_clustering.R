# Weather Clustering Analysis in R
# Author: Divyanshi Mishra

# -------------------------------------------------------
# 1. Load data
# -------------------------------------------------------
myData <- read.csv("myData.csv")

# -------------------------------------------------------
# 2. Summary
# -------------------------------------------------------
summary(myData)

# -------------------------------------------------------
# 3. Remove NA station_id rows
# -------------------------------------------------------
idx <- which(is.na(myData$station_id))
myData <- myData[-idx, ]

# -------------------------------------------------------
# 4. Remove duplicated station IDs
# -------------------------------------------------------
idx1 <- duplicated(myData$station_id)
myData <- myData[!idx1, ]

# -------------------------------------------------------
# 5. Handle NA values
# -------------------------------------------------------

# a. Fill NA precipitation with 0
idx2 <- which(is.na(myData$precipitation))
myData[idx2, "precipitation"] <- 0

# b. Fill NA wind speed with national median
idx3 <- which(is.na(myData$wind_speed))
myData[idx3, "wind_speed"] <- median(myData$wind_speed, na.rm = TRUE)

# -------------------------------------------------------
# 6. Remove Alaska and Hawaii
# -------------------------------------------------------
Alaska <- which(myData$state == "Alaska")
myData <- myData[-Alaska, ]

Hawaii <- which(myData$state == "Hawaii")
myData <- myData[-Hawaii, ]

# -------------------------------------------------------
# 7. Visualization: Temp Map
# -------------------------------------------------------
library(ggplot2)

ggplot(myData, aes(x = lon, y = lat)) +
  geom_point(aes(col = mean_temp)) +
  scale_color_gradient(low = "gold", high = "red") +
  labs(x = "Longitude", y = "Latitude", color = "Mean Temp")

# -------------------------------------------------------
# 8. Subset for clustering
# -------------------------------------------------------
subset_myData <- myData[, c("mean_temp", "wind_speed", "precipitation")]

# -------------------------------------------------------
# 9. K-Means Clustering (k = 5)
# -------------------------------------------------------
km <- kmeans(subset_myData, centers = 5, nstart = 100)

# Size of each cluster
km$size

# Cluster centers
km$centers

# Add cluster labels
myData$km_cluster <- as.factor(km$cluster)

# Plot K-means clusters
ggplot(myData, aes(x = lon, y = lat)) +
  geom_point(aes(col = km_cluster)) +
  scale_color_manual(values = c("purple", "red", "green", "blue", "orange")) +
  labs(x = "Longitude", y = "Latitude", color = "K-means Cluster")

# -------------------------------------------------------
# 10. Hierarchical Clustering
# -------------------------------------------------------
d <- dist(subset_myData)
hc <- hclust(d, method = "complete")

# Plot dendrogram
plot(hc, main = "Hierarchical Clustering Dendrogram")

# Cut into 3 clusters
hc_membership <- cutree(hc, k = 3)
myData$hc_cluster <- as.factor(hc_membership)

# Plot hierarchical clusters
ggplot(myData, aes(x = lon, y = lat)) +
  geom_point(aes(col = hc_cluster)) +
  labs(x = "Longitude", y = "Latitude", color = "HC Cluster")
