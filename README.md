# Penerapan-Algoritma-Machine-Learning-untuk-Memprediksi-Risiko-Kredit-pada-Nasabah-Bank
## 1. Tujuan Penelitian
Penelitian ini bertujuan untuk:

- Menerapkan teknik **machine learning** guna memprediksi risiko kredit nasabah, sehingga membantu bank menilai kelayakan kredit secara lebih efektif.
- Mengidentifikasi faktor-faktor yang berkontribusi terhadap risiko kredit melalui analisis data, untuk menemukan pola yang memengaruhi.
- Membangun model prediktif yang dapat mengklasifikasikan nasabah sebagai risiko kredit baik atau buruk, sehingga meminimalkan kerugian akibat kredit macet.

## 2. Rumusan Masalah
Rumusan masalah yang diangkat dalam penelitian ini adalah:

- Faktor-faktor apa saja yang memengaruhi risiko kredit nasabah di bank?
- Bagaimana penerapan teknik **machine learning** dapat meningkatkan akurasi prediksi risiko kredit dibandingkan dengan metode tradisional?
- Model **machine learning** apa yang paling efektif dalam memprediksi risiko kredit pada dataset ini?
- Sejauh mana model yang dibangun dapat diandalkan dalam mengidentifikasi nasabah berisiko tinggi?

## 3. Metodologi Penelitian
Metodologi yang diterapkan dalam penelitian ini mencakup:

- **Pengumpulan Data**: Menggunakan dataset yang relevan, yang memuat informasi nasabah serta atribut yang berhubungan dengan risiko kredit.
- **Preprocessing Data**: Membersihkan dan mentransformasi data agar siap digunakan dalam model **machine learning**.
- **Pemilihan Model**: Menggunakan beberapa algoritma **machine learning** seperti **Decision Tree**, **Random Forest**, **Logistic Regression**, dan **Support Vector Machine (SVM)** untuk membangun model prediktif.
- **Evaluasi Model**: Mengukur kinerja model menggunakan metrik akurasi, precision, recall, dan AUC-ROC.

## 4. Perbandingan Model
### Random Forest
- **Akurasi**: 100%
- **Jumlah Pohon**: Menggunakan beberapa pohon keputusan (ensembling).
- **Keunggulan**: Mengatasi overfitting lebih baik karena menggunakan banyak pohon dan pengambilan keputusan berdasarkan suara mayoritas.
- **Cross-validation**: Akurasi meningkat seiring bertambahnya jumlah pohon.

### Decision Tree
- **Akurasi**: 100% pada data uji.
- **Keunggulan**: Mudah diinterpretasikan karena divisualisasikan dalam bentuk pohon.
- **Kelemahan**: Rentan terhadap overfitting pada dataset kecil tanpa **pruning**.
- **Cross-validation**: Akurasi tetap 100% saat parameter **pruning** (cp = 0.5), namun menurun jika cp terlalu tinggi.

### Support Vector Machine (SVM)
- **Akurasi**: 87.26% pada data uji.
- **Keunggulan**: Memisahkan kelas menggunakan hyperplane dan bekerja baik pada data berdimensi tinggi.
- **Kelemahan**: Waktu komputasi lebih lama untuk dataset besar dan sulit diinterpretasikan dibandingkan model pohon.

## 5. Jawaban untuk Rumusan Masalah
- **Faktor yang Mempengaruhi Risiko Kredit**: Berdasarkan **importance plot** (MeanDecreaseAccuracy dan MeanDecreaseGini), fitur yang paling mempengaruhi prediksi risiko kredit adalah:
  - **Credit_amount** (Jumlah Kredit)
  - **Duration** (Lama Waktu Pinjaman)
  - **Housing**, **Job**, dan **Checking.account** berperan penting, meskipun pengaruhnya lebih kecil.
  
  **Jawaban**: Faktor paling berpengaruh dalam memprediksi risiko kredit adalah jumlah kredit, lama waktu pinjaman, dan status perumahan.

- **Prediksi Risiko Kredit**: Menggunakan model **Random Forest**, akurasi prediksi mencapai **100%**. Model ini menunjukkan akurasi tinggi dalam memprediksi risiko kredit berdasarkan variabel yang ada.

  **Jawaban**: Model **Random Forest** dapat memprediksi risiko kredit dengan akurasi yang sangat tinggi. Variabel seperti jumlah kredit, durasi, dan status perumahan memainkan peran utama.

## 6. Kesimpulan dan Rekomendasi
- **Kesimpulan**: Jumlah kredit dan lama waktu pinjaman adalah faktor utama yang harus dipertimbangkan dalam menilai risiko kredit nasabah. Model **Random Forest** memberikan akurasi tinggi dalam prediksi risiko, memungkinkan bank untuk lebih berhati-hati dalam memberikan pinjaman besar.
  
- **Rekomendasi**: Untuk meningkatkan keputusan kredit, analisis lebih mendalam terhadap variabel penting perlu dilakukan, serta validasi lebih lanjut menggunakan **cross-validation** atau penyesuaian parameter model untuk menghindari overfitting.
