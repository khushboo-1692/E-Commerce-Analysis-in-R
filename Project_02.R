
setwd(choose.dir())
getwd()

ecom <- read.csv('Ecommerce.csv')
str(ecom)
View(ecom)
summary(ecom)

ecom <- ecom[,-8]
str(ecom)
summary(ecom)
View(ecom)

library(lubridate)
library(dplyr)

ecom1 <- filter(ecom,UnitPrice>0, Quantity>0)
boxplot(ecom1$UnitPrice)
boxplot(ecom1$Quantity)
str(ecom1$CustomerID)

ecom <- ecom %>% mutate(new_date=dmy(InvoiceDate))
str(ecom)

ecom$InvoiceNo <- as.numeric(ecom$InvoiceNo)
str(ecom)

ecom$StockCode <- as.numeric(ecom$StockCode)
str(ecom)

ecom$Country <- as.numeric(ecom$Country)
str(ecom)

ecom$Quantity <- as.numeric(ecom$Quantity)
str(ecom)

ecom$CustomerID <- as.numeric(ecom$CustomerID)
str(ecom)

ecom <- ecom[,-4]
View(ecom)

summary(ecom)

hist(ecom$CustomerID, breaks = 20)
library(caret)
any(is.na(ecom$CustomerID))

colSums(is.na(ecom))

View(ecom)

impute <- preProcess(ecom[,c(1:7)], method = c('knnImpute'))

install.packages('RANN')
library(RANN)
ecom_1 <- predict(impute, ecom[,c(1:7)])

any(is.na(ecom_1))

View(ecom_1)









ecom1 <- scale(ecom[,-7])
View(ecom1)
summary(ecom1)
