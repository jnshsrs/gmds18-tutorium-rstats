library(rpart.plot)
library(rpart)
library(tidyverse)
library(rattle)

titanic <- read.csv("data/titanic.csv")

titanic %>% 
  ggplot(aes(x = factor(pclass), y = fare)) + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = .15, size = 1.25) + 
  stat_summary(fun.y = mean, geom = "point", size = 2) +
  geom_point(alpha = .05) +
  ylab("Fahrpreis in Dollar (1912)") +
  scale_x_discrete(labels = c("1. Klasse", "2. Klasse", "3. Klasse")) +
  scale_y_continuous(label = scales::dollar_format(), breaks = seq(0, 120, by = 20), limits = c(0, 120)) +
  theme_bw() +
  theme(axis.title.x = element_blank(), 
        axis.text = element_text(size = 12))

train <- titanic %>% select(survived, sex, age, pclass)
decision_tree <- rpart(survived ~ .,
                 data = train,
                 method ="class")



fancyRpartPlot(decision_tree, main = "", sub = "Welche Personen haben den Titanic-Untergang überlebt?")
