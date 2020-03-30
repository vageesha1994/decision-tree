install.packages("C50")
library(C50)
install.packages("tree")
library(tree)
install.packages("gmodels")
library(gmodels)
fraud<-read.csv("F://vag/Fraud_check.csv")
View(fraud)
hist(fraud$Taxable.Income)

x<-data.frame(fraud,Risky_Good)
fraud_train<-x[1:400,]
fraud_test<-x[401:600,]
###tree<-tree(Risky_Good~Undergrad+Marital.Status+City.Population+Work.Experience+Urban, data=x)
##summary(tree)
tree<-tree(Taxable.Income~.,data=fraud)
windows()
plot(tree)
text(tree,pretty = 0)
pred_tree<-as.data.frame(predict(tree,fraud))
pred_tree["Final1"]<-ifelse(fraud$Taxable.Income<=30000, "Risky", "Good")
CrossTable(fraud$Taxable.Income,pred_tree$Final1)
mean(pred_tree$Final1==fraud$Taxable.Income)
 