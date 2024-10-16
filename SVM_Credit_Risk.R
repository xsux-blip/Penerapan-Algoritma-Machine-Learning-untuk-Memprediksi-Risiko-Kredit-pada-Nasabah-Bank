# Library yang diperlukan
library(e1071)
library(ggplot2)

# Pemuatan dataset
data <- read.csv("E:/homework/Credit Risk/german_credit_data.csv")  # Ganti dengan path file Anda

# Melihat struktur data
str(data)

# Preprocessing data
# Mengonversi faktor
data$Sex <- as.factor(data$Sex)
data$Housing <- as.factor(data$Housing)
data$Saving.accounts <- as.factor(data$Saving.accounts)
data$Checking.account <- as.factor(data$Checking.account)
data$Purpose <- as.factor(data$Purpose)

# Mengonversi kolom klasifikasi menjadi faktor (misalnya, jika 'good' dan 'bad' adalah hasil)
data$Risk <- as.factor(ifelse(data$Credit_amount > 1000, "bad", "good"))  # Contoh, sesuaikan dengan kondisi Anda

# Menghapus baris dengan NA
data <- na.omit(data)

# Membagi dataset menjadi training dan testing (70% untuk training, 30% untuk testing)
set.seed(123)  # Untuk reproduktifitas
train_indices <- sample(1:nrow(data), 0.7 * nrow(data))  # 70% untuk training
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]

# Melatih model SVM
svm_model <- svm(Risk ~ Age + Sex + Job + Housing + Saving.accounts + 
                   Checking.account + Credit_amount + Duration + Purpose, 
                 data = train_data)

# Melihat ringkasan model
summary(svm_model)

# Memprediksi hasil pada data testing
predictions <- predict(svm_model, newdata = test_data)

# Pastikan panjang prediksi sama dengan target
cat("Panjang prediksi:", length(predictions), "Panjang data target:", length(test_data$Risk))

# Menghitung akurasi
accuracy <- mean(predictions == test_data$Risk)
cat("Akurasi Model SVM:", accuracy, "\n")

# Membuat confusion matrix
confusion_matrix <- table(test_data$Risk, predictions)
print("Confusion Matrix:")
print(confusion_matrix)

# Visualisasi (jika diperlukan, terutama untuk data 2D)
# Anda perlu menyesuaikan fitur visualisasi sesuai dengan variabel yang ada
ggplot(data, aes(x = Age, y = Credit_amount, color = Risk)) + 
  geom_point() + 
  ggtitle("Visualisasi Risiko Kredit Berdasarkan Usia dan Jumlah Kredit")

# Visualisasi hasil SVM (hanya jika model dan data cocok untuk 2D)
plot(svm_model, train_data, Age ~ Credit_amount, 
     main = "SVM Classifier")
