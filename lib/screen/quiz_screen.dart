import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../widgets/option_button.dart';
import '../widgets/custom_button.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName;

  const QuizScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;
  List<int?> userAnswers = List.filled(quizQuestions.length, null);

  void _nextQuestion() {
    if (selectedOptionIndex != null) {
      setState(() {
        userAnswers[currentQuestionIndex] = selectedOptionIndex;

        if (currentQuestionIndex < quizQuestions.length - 1) {
          currentQuestionIndex++;
          selectedOptionIndex = userAnswers[currentQuestionIndex];
        } else {
          // Navigate to result screen
          _goToResult();
        }
      });
    }
  }

  void _goToResult() {
    int score = 0;
    for (int i = 0; i < quizQuestions.length; i++) {
      if (userAnswers[i] == quizQuestions[i].correctAnswerIndex) {
        score++;
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          userName: widget.userName,
          score: score,
          totalQuestions: quizQuestions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final currentQuestion = quizQuestions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFFF1493),
      body: SafeArea(
        child: Column(
          children: [
            // Header dengan Progress
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Row(
                children: [
                  Icon(Icons.quiz, color: Colors.white, size: screenWidth * 0.08),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ${currentQuestionIndex + 1}/${quizQuestions.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        LinearProgressIndicator(
                          value: (currentQuestionIndex + 1) / quizQuestions.length,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                          minHeight: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Question Card
            Expanded(
              child: Container(
                width: screenWidth * 0.9,
                margin: EdgeInsets.all(screenWidth * 0.05),
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Gambar (jika ada)
                      if (currentQuestion.imageUrl != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            currentQuestion.imageUrl!,
                            height: screenHeight * 0.2,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                      ],

                      // Pertanyaan
                      Text(
                        currentQuestion.question,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // Pilihan Jawaban
                      ...List.generate(
                        currentQuestion.options.length,
                            (index) => OptionButton(
                          label: String.fromCharCode(65 + index) + '.',
                          text: currentQuestion.options[index],
                          isSelected: selectedOptionIndex == index,
                          onTap: () {
                            setState(() {
                              selectedOptionIndex = index;
                            });
                          },
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      // Tombol Next/Finish
                      CustomButton(
                        text: currentQuestionIndex == quizQuestions.length - 1
                            ? 'FINISH'
                            : 'NEXT QUESTION',
                        onPressed: _nextQuestion,
                        isEnabled: selectedOptionIndex != null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}