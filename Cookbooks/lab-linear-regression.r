data <- read.csv(file = "./00-Resources/Datasets/Boston.csv",
                 head = TRUE)
lm.fit <- lm(medv ~ lstat, data = data)