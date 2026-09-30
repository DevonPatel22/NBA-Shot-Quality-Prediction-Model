#NAME: Devon Patel | Number: 7490

#Libraries Used
library(readr)
library(dplyr)
library(tidyverse)

#Load Training Data
train_df <- read.csv("training.csv.gz")

#Convert Outcome to Binary Values
train_df <- train_df |> mutate(outcome = as.integer(outcome))

#Exploring and Verifying features

#mean(refined$outcome[refined$num_contesters == 0])
#mean(refined$outcome[refined$num_contesters == 1])
#mean(refined$outcome[refined$num_contesters == 2])
#mean(refined$outcome[refined$num_contesters == 3])

#mean(refined$outcome[refined$gamestate == 'TRANSITION'])
#mean(refined$outcome[refined$gamestate == 'HALFCOURT'])
#mean(refined$outcome[refined$gamestate == 'DIRECTSECONDCHANCE'])

#mean(refined$outcome[refined$shotclock > 12])
#mean(refined$outcome[refined$shotclock < 3])

#mean(refined$outcome[refined$shottype == 'jumper'])
#mean(refined$outcome[refined$shottype == 'layup'])
#mean(refined$outcome[refined$shottype == 'dunk'])
#mean(refined$outcome[refined$shottype == 'post'])
#mean(refined$outcome[refined$shottype == 'floater'])
#mean(refined$outcome[refined$shottype == 'tip'])
#mean(refined$outcome[refined$shottype == 'heave'])

#Train the Logistic Regression model on the chosen features
logistic_model <- glm(outcome ~ distance + shottype + shotclock + gamestate + num_contesters,
                      data = train_df,
                      family = "binomial")
summary(logistic_model)

#Load and Generate Predictions on the Testing Data
test_data <- read.csv("testing.csv.gz")
test_data$make_prob <- predict(logistic_model, newdata = test_data, type = "response")

#Refine Predictions to match Submission Format
finalPredictions <- test_data |>
  select(shot_id, make_prob)

#Write Results to submission.csv
write.csv(finalPredictions, "submission.csv")
View(submission)

