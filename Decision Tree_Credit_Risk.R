# Install and load necessary packages
install.packages("rpart")
install.packages("rpart.plot")
install.packages("caTools")

library(rpart)
library(rpart.plot)
library(caTools)

# 1. Load dataset dari path lokal Anda
data <- read.csv("E:/homework/Credit Risk/german_credit_data.csv")

# 2. Preprocessing
# Menghapus kolom yang tidak relevan
data$Unnamed..0 <- NULL

# Mengganti missing values pada kolom 'Saving accounts' dan 'Checking account' dengan 'unknown'
data$Saving.accounts[is.na(data$Saving.accounts)] <- 'unknown'
data$Checking.account[is.na(data$Checking.account)] <- 'unknown'

# Mengubah variabel kategorikal menjadi factor
data$Sex <- as.factor(data$Sex)
data$Housing <- as.factor(data$Housing)
data$Saving.accounts <- as.factor(data$Saving.accounts)
data$Checking.account <- as.factor(data$Checking.account)
data$Purpose <- as.factor(data$Purpose)

# Membuat variabel target (misalnya kita tentukan bahwa nasabah dengan "Credit amount" > 4000 adalah risiko tinggi)
data$Risk <- ifelse(data$Credit_amount > 4000, "high", "low")
data$Risk <- as.factor(data$Risk)

# 3. Train-Test Split (70% training, 30% testing)
set.seed(123)  # Untuk mendapatkan hasil yang konsisten
split <- sample.split(data$Risk, SplitRatio = 0.7)
training_set <- subset(data, split == TRUE)
test_set <- subset(data, split == FALSE)

# 4. Build Decision Tree Model
decision_tree <- rpart(Risk ~ Age + Sex + Job + Housing + Saving.accounts + Checking.account + 
                         Credit_amount + Duration + Purpose, data = training_set, method = "class")

# Visualisasi Decision Tree
rpart.plot(decision_tree)

# 5. Evaluasi Model
# Prediksi pada data uji
predictions <- predict(decision_tree, newdata = test_set, type = "class")

# Confusion matrix dan akurasi
confusion_matrix <- table(test_set$Risk, predictions)
confusion_matrix

# Menghitung akurasi
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy: ", round(accuracy * 100, 2), "%"))

#Cross Validation
# Load library
library(caret)
library(rpart)
library(rpart.plot)

# 1. Load dataset
data <- read.csv("E:/homework/Credit Risk/german_credit_data.csv")
data$Unnamed..0 <- NULL
data$Saving.accounts[is.na(data$Saving.accounts)] <- 'unknown'
data$Checking.account[is.na(data$Checking.account)] <- 'unknown'

data$Sex <- as.factor(data$Sex)
data$Housing <- as.factor(data$Housing)
data$Saving.accounts <- as.factor(data$Saving.accounts)
data$Checking.account <- as.factor(data$Checking.account)
data$Purpose <- as.factor(data$Purpose)
data$Risk <- ifelse(data$Credit_amount > 4000, "high", "low")
data$Risk <- as.factor(data$Risk)

# 2. Mengatur k-fold cross-validation
set.seed(123)  # Untuk reproduktifitas
control <- trainControl(method = "cv", number = 10)  # 10-fold cross-validation

# 3. Build Decision Tree Model dengan cross-validation
decision_tree_cv <- train(Risk ~ Age + Sex + Job + Housing + 
                            Saving.accounts + Checking.account + 
                            Credit_amount + Duration + Purpose,
                          data = data, 
                          method = "rpart", 
                          trControl = control)

# 4. Menampilkan hasil
print(decision_tree_cv)
