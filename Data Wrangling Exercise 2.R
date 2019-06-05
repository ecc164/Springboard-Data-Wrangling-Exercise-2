#Load Data and Relevant Packages
```{r}
library(dplyr)
library(tidyr)
library(readxl)
titanic_original_csv <- read_excel("titanic_original.csv.xls")
titanic <- titanic_original_csv
```
#Change missing values in embarked column to S
```{r}
titanic$embarked[titanic$embarked == NA] <- "S" 
```
#Use mean of age column to populate missing values
```{r}
avg <- mean(titanic$age, na.rm = TRUE)
titanic$age[titanic$age == NA] <- avg
```
#Fill missing values in boat column with string None
```{r}
titanic$boat[is.na(titanic$boat)] <- "None"
```
#Create a new column, has_cabin_number, which has 1 if there is a number and 0 if not
```{r}
titanic <- mutate(titanic, has_cabin_number = ifelse(is.na(titanic$cabin), 0, 1))
```
