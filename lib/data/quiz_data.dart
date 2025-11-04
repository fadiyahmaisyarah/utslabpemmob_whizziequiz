import '../models/question.dart';

final List<Question> quizQuestions = [
  Question(
    question: 'Apa ibu kota Indonesia?',
    options: ['Bandung', 'Jakarta', 'Surabaya', 'Riau'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'Berapa hasil dari 2 + 16?',
    options: ['15', '19', '18', '20'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'Bentuk apakah yang terlihat pada gambar di atas?',
    options: ['Persegi', 'Segitiga', 'Oval', 'Lingkaran'],
    correctAnswerIndex: 2,
    imageUrl: 'assets/images/donut.png',
  ),
  Question(
    question: 'Sambung kata berikut agar membentuk kalimat yang benar: TEKNO...',
    options: ['...KOPI', '...LOGI', '...KIMIA', '...GRAFIS'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'Apa yang sedang dirasakan anak pada gambar ini?',
    options: ['Sakit Gigi', 'Sakit Hati', 'Sakit Perut', 'Sakit Tenggorokan'],
    correctAnswerIndex: 0,
    imageUrl: 'assets/images/girl.png',
  ),
];