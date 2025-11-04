class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String? imageUrl;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.imageUrl,
  });
}