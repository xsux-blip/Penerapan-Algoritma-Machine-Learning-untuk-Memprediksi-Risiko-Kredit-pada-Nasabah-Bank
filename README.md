# Penerapan-Algoritma-Machine-Learning-untuk-Memprediksi-Risiko-Kredit-pada-Nasabah-Bank
# Analisis dan Prediksi Risiko Kredit dengan Machine Learning

## 1. Tujuan Penelitian
Tujuan dari penelitian ini adalah untuk:

- Menerapkan teknik machine learning untuk memprediksi risiko kredit pada nasabah bank, sehingga dapat membantu bank dalam menilai kelayakan kredit secara lebih efektif.
- Mengidentifikasi faktor-faktor yang berkontribusi terhadap risiko kredit, dengan menggunakan analisis data untuk mengetahui pola yang ada.
- Membangun model prediktif yang dapat mengklasifikasikan nasabah sebagai risiko kredit baik atau buruk, sehingga dapat meminimalkan kerugian bank akibat kredit macet.

## 2. Rumusan Masalah
Rumusan masalah dalam penelitian ini bisa berupa:

- Apa saja faktor-faktor yang mempengaruhi risiko kredit nasabah di bank?
- Bagaimana penerapan teknik machine learning dapat meningkatkan akurasi dalam memprediksi risiko kredit dibandingkan dengan metode tradisional?
- Model machine learning apa yang paling efektif untuk memprediksi risiko kredit pada dataset ini?
- Sejauh mana model yang dibangun dapat diandalkan dalam mengidentifikasi nasabah berisiko tinggi?

## 3. Metodologi Penelitian
Metodologi yang dapat digunakan dalam penelitian ini antara lain:

1. **Pengumpulan Data**: Menggunakan dataset yang relevan yang berisi informasi tentang nasabah dan atribut yang berhubungan dengan risiko kredit.
2. **Preprocessing Data**: Melakukan pembersihan dan transformasi data agar siap digunakan dalam model machine learning.
3. **Pemilihan Model**: Menggunakan berbagai algoritma machine learning (seperti Decision Tree, Random Forest, Logistic Regression, dan Support Vector Machine) untuk membangun model prediktif.
4. **Evaluasi Model**: Mengukur kinerja model menggunakan metrik seperti akurasi, precision, recall, dan AUC-ROC.

## 4. Hasil Evaluasi Model

### 4.1. Random Forest
**Hasil Evaluasi Model Random Forest**:
Berdasarkan model Random Forest yang Anda bangun dan hasil visualisasi yang diunggah, berikut adalah hasil yang bisa disimpulkan:

- **Confusion Matrix** menunjukkan bahwa model Anda memiliki hasil yang sangat baik, dengan akurasi 100% pada data uji:
  - High risk: 74 prediksi benar, 0 salah.
  - Low risk: 226 prediksi benar, 0 salah.
- **Akurasi Model**: 100%. Ini berarti model dapat mengklasifikasikan semua data uji dengan benar, meskipun ini dapat menjadi tanda overfitting karena akurasi yang terlalu tinggi pada data uji.

### 4.2. Pentingnya Fitur
Dari plot **MeanDecreaseAccuracy** dan **MeanDecreaseGini**, fitur yang paling penting untuk prediksi adalah:

- **Credit_amount**: Berkontribusi paling besar dalam model.
- **Duration** dan **Housing** juga memberikan pengaruh yang signifikan, terutama pada pengurangan Gini.
- Fitur-fitur lain seperti **Job**, **Age**, dan **Purpose** memberikan kontribusi yang lebih kecil dalam model.

### 4.3. Learning Curve
Plot **learning curve** menunjukkan bagaimana akurasi model berubah dengan bertambahnya ukuran sampel:

- Model mempertahankan akurasi yang sangat tinggi hampir mendekati 100%, meskipun terlihat adanya fluktuasi kecil di ukuran sampel tertentu.
- Ini bisa berarti bahwa meskipun model beradaptasi dengan baik, ia mungkin terlalu dipengaruhi oleh data latih, yang mengarah pada potensi overfitting.

## 5. Perbandingan Model
### 5.1. Random Forest
- **Akurasi**: 100%
- **Jumlah Pohon**: Menggunakan pendekatan ansambel dengan beberapa pohon keputusan.
- **Keunggulan**: Lebih baik dalam menangani overfitting karena menggunakan banyak pohon dan mengambil keputusan berdasarkan suara mayoritas.
- **Cross-validation**: Menghasilkan akurasi tertinggi saat jumlah pohon bertambah.

### 5.2. Decision Tree
- **Akurasi**: 100% pada data uji.
- **Keunggulan**: Mudah diinterpretasikan karena bisa divisualisasikan dalam bentuk pohon.
- **Kelemahan**: Rentan terhadap overfitting pada dataset kecil dan tanpa pruning. Akurasi menurun jika parameter pruning (cp = 1.0) diterapkan.

### 5.3. Support Vector Machine (SVM)
- **Akurasi**: 87.26% pada data uji.
- **Keunggulan**: SVM menggunakan hyperplane untuk memisahkan kelas dan bekerja baik pada data dengan dimensi tinggi.
- **Kelemahan**: SVM memerlukan waktu komputasi lebih lama pada dataset besar dan cenderung sulit diinterpretasikan dibandingkan model pohon.

## 6. Kesimpulan dan Rekomendasi

### Kesimpulan:
- Jumlah kredit dan lama waktu pinjaman adalah faktor utama yang harus dipertimbangkan dalam penilaian risiko kredit nasabah. Dengan menggunakan model Random Forest, prediksi risiko dapat dilakukan dengan akurasi tinggi.
- Random Forest menunjukkan performa yang sangat kuat dalam mengklasifikasikan nasabah berisiko tinggi dengan akurasi mencapai 100%.

### Rekomendasi:
- Untuk meningkatkan ketepatan keputusan kredit, sebaiknya dilakukan analisis yang lebih dalam terhadap variabel-variabel yang penting, serta melakukan validasi lebih lanjut menggunakan teknik cross-validation atau tuning parameter model untuk mencegah potensi overfitting.

- **Analisis Tambahan**: Untuk meningkatkan pemahaman lebih dalam terkait faktor-faktor yang mempengaruhi risiko kredit, dapat dilakukan **Feature Engineering** dengan menciptakan fitur baru dari data yang sudah ada. Selain itu, **Hyperparameter Tuning** pada model **Random Forest** atau **SVM** bisa meningkatkan akurasi prediksi secara signifikan.
