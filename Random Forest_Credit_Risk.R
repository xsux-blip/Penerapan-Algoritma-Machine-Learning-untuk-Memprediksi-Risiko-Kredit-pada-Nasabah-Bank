# 1. Install dan load paket yang diperlukan
install.packages("randomForest")  # Jalankan ini jika belum terinstall
library(randomForest)
library(caret)
library(caTools)

# 2. Load dataset
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

# 3. Train-Test Split (70% training, 30% testing)
set.seed(123)  # Untuk mendapatkan hasil yang konsisten
split <- sample.split(data$Risk, SplitRatio = 0.7)
training_set <- subset(data, split == TRUE)
test_set <- subset(data, split == FALSE)

# 4. Build Random Forest Model
rf_model <- randomForest(Risk ~ Age + Sex + Job + Housing + 
                           Saving.accounts + Checking.account + 
                           Credit_amount + Duration + Purpose,
                         data = training_set,
                         ntree = 100,       # Jumlah pohon dalam hutan
                         mtry = 3,          # Jumlah variabel acak yang dipilih di setiap split
                         importance = TRUE) # Menghitung pentingnya variabel

# 5. Menampilkan ringkasan model
print(rf_model)

# 6. Evaluasi Model
# Prediksi pada data uji
predictions <- predict(rf_model, newdata = test_set)

# Confusion matrix dan akurasi
confusion_matrix <- table(test_set$Risk, predictions)
print(confusion_matrix)

# Menghitung akurasi
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy: ", round(accuracy * 100, 2), "%"))

# 7. Visualisasi pentingnya variabel
importance(rf_model)
varImpPlot(rf_model)


# Library yang diperlukan
library(rpart)
library(rpart.plot)
library(caTools)
library(randomForest)
library(ggplot2)

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

# 2. Train-Test Split
set.seed(123)
split <- sample.split(data$Risk, SplitRatio = 0.7)
training_set <- subset(data, split == TRUE)
test_set <- subset(data, split == FALSE)

# 3. Fungsi untuk menghitung akurasi model
calculate_accuracy <- function(train_data, test_data) {
  model <- randomForest(Risk ~ Age + Sex + Job + Housing + Saving.accounts + 
                          Checking.account + Credit_amount + Duration + Purpose,
                        data = train_data)
  predictions <- predict(model, newdata = test_data)
  return(mean(predictions == test_data$Risk))
}

# 4. Hitung akurasi untuk berbagai ukuran data latih
set.seed(123)
sample_sizes <- seq(50, nrow(training_set), by = 50)
accuracies <- sapply(sample_sizes, function(size) {
  train_sample <- training_set[sample(1:nrow(training_set), size), ]
  calculate_accuracy(train_sample, test_set)
})

# 5. Plot Learning Curve
learning_curve <- data.frame(Sample_Size = sample_sizes, Accuracy = accuracies)
ggplot(learning_curve, aes(x = Sample_Size, y = Accuracy)) +
  geom_line() +
  geom_point() +
  ggtitle("Learning Curve for Random Forest Model") +
  xlab("Sample Size") +
  ylab("Accuracy")

