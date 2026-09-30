# NBA Expected Shot Make Probability ($xFG\%$) Model

An analytics project built in R to evaluate NBA shot quality and estimate expected field goal percentage using player tracking and contextual situational data.

---

## Project Overview
Evaluating players purely on shot outcomes (made vs. missed shots) has too much variance. This project uses a Logistic Regression model to predicts shot conversion probabilities based on situational parameters, allowing front offices and coaching staff to evaluate offensive shot selection and defensive scheme quality independently of outcome.

---

## Selected Features
From the raw tracking dataset, 5 independent features were selected to eliminate overlap, but stay relevant:

- **`distance`**: Distance from the hoop (in feet).
- **`shottype`**: Category of shot (`dunk`, `layup`, `jumper`, `floater`, `post`, `tip`, `heave`).
- **`shotclock`**: Time remaining on the shot clock ($0$ to $24$ seconds).
- **`gamestate`**: Game Situation to decide pace (`HALFCOURT`, `TRANSITION`, `DIRECTSECONDCHANCE`).
- **`num_contesters`**: Number of contesting defenders.

---

## Tools
- **Language:** R
- **Libraries:** `tidyverse`, `ggplot2`, `readr`
- **Model:** Logistic Regression (`glm` with `family = "binomial"`)

---

## Repository Structure
- `project_code.R` - Full R script for data cleaning, model fitting, and prediction export.
- `project_writeup.Rmd` - R Markdown source file generating the executive report and charts.
- `project_writeup.html` - Knitted HTML report featuring model summaries and visualizations.

---
