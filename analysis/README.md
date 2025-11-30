# Weather Clustering Analysis in RStudio

This project applies clustering methods to weather observations collected across the United States. Using average temperature, wind speed, and precipitation, the analysis performs data cleaning, feature preprocessing, K-means clustering, hierarchical clustering, and geospatial visualization.

### 🔍 Key Steps
• Importing and inspecting the weather dataset  
• Removing missing or duplicated station IDs  
• Filling NA values for precipitation and wind speed  
• Removing Alaska and Hawaii observations for continental focus  
• Visualizing locations by mean temperature  
• Performing K-means clustering (k = 5)  
• Plotting clusters on a longitude–latitude map  
• Performing hierarchical clustering with complete linkage  
• Cutting tree into 3 clusters and visualizing groupings  

### 🧰 Tools Used
• R / RStudio  
• ggplot2  
• stats package  

### 🎯 Goal
To explore weather similarities across US locations using clustering techniques and identify geospatial patterns.

### 📝 Problem Statement
The objective is to analyze U.S. weather station data and identify natural groupings of locations based on their climatic characteristics. The dataset contains temperature, wind speed, and precipitation measurements across multiple states. The task involves preparing the data, handling missing or duplicated entries, removing outlier regions, and applying clustering methods to uncover meaningful patterns. Both K-means and hierarchical clustering are used to determine how weather conditions vary geographically across the continental United States.
