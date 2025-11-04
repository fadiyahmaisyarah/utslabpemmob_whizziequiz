import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
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
  bool showResult = false;

  void _nextQuestion() {
    if (selectedOptionIndex != null) {
      setState(() {
        userAnswers[currentQuestionIndex] = selectedOptionIndex;

        if (currentQuestionIndex < quizQuestions.length - 1) {
          currentQuestionIndex++;
          selectedOptionIndex = userAnswers[currentQuestionIndex];
          showResult = false;
        } else {
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

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE51CAD),
            Color(0xFFDA17AE),
            Color(0xFFCF12AF),
            Color(0xFFC40DB0),
            Color(0xFFB908B1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Row(
                  children: [

                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: screenWidth * 0.08,
                        height: screenWidth * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: screenWidth * 0.05,
                        ),
                      ),
                    ),
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
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Afacad',
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: (currentQuestionIndex + 1) / quizQuestions.length,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                              minHeight: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: screenWidth * 0.9,
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.02,
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.06),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5D9EE),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        if (currentQuestion.imageUrl != null) ...[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              currentQuestion.imageUrl!,
                              height: screenHeight * 0.18,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],

                        Text(
                          currentQuestion.question,
                          style: TextStyle(
                            fontSize: screenWidth * 0.048,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFE91E93),
                            fontFamily: 'Afacad',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.03),

                        ...List.generate(
                          currentQuestion.options.length,
                              (index) => _buildOptionButton(
                            label: String.fromCharCode(65 + index),
                            text: currentQuestion.options[index],
                            index: index,
                            correctIndex: currentQuestion.correctAnswerIndex,
                            screenWidth: screenWidth,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: selectedOptionIndex != null ? _nextQuestion : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedOptionIndex != null
                                  ? const Color(0xFFE91E93)
                                  : Colors.grey.shade400,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                vertical: screenWidth * 0.04,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              currentQuestionIndex == quizQuestions.length - 1
                                  ? 'FINISH'
                                  : 'NEXT QUESTION',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Afacad',
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required String label,
    required String text,
    required int index,
    required int correctIndex,
    required double screenWidth,
  }) {
    bool isSelected = selectedOptionIndex == index;
    bool isCorrect = index == correctIndex;

    Color backgroundColor;
    Color borderColor;
    Color textColor;

    if (showResult) {

      if (isCorrect) {
        backgroundColor = const Color(0xFFB8F5CD); // Hijau muda
        borderColor = const Color(0xFF4CAF50);
        textColor = const Color(0xFF2E7D32);
      } else if (isSelected) {
        backgroundColor = const Color(0xFFFFCDD2); // Merah muda
        borderColor = const Color(0xFFF44336);
        textColor = const Color(0xFFC62828);
      } else {
        backgroundColor = Colors.white;
        borderColor = const Color(0xFFE91E93).withOpacity(0.2);
        textColor = const Color(0xFFE91E93);
      }
    } else {

      if (isSelected) {
        backgroundColor = const Color(0xFFB8F5CD);
        borderColor = const Color(0xFF4CAF50);
        textColor = const Color(0xFF2E7D32);
      } else {
        backgroundColor = Colors.white;
        borderColor = const Color(0xFFE91E93).withOpacity(0.2);
        textColor = const Color(0xFFE91E93);
      }
    }

    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.03),
      child: InkWell(
        onTap: showResult ? null : () {
          setState(() {
            selectedOptionIndex = index;
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [

              Container(
                width: screenWidth * 0.08,
                height: screenWidth * 0.08,
                decoration: BoxDecoration(
                  color: isSelected ? borderColor.withOpacity(0.2) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$label.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontFamily: 'Afacad',
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),

              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: screenWidth * 0.038,
                    color: textColor,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontFamily: 'Afacad',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}