import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startQuiz() {
    if (_nameController.text.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreen(
            userName: _nameController.text.trim(),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter your name'),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

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
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.06),

                    Image.asset(
                      'assets/images/logo.png',
                      width: screenWidth * 0.7,
                      height: screenWidth * 0.7,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: screenHeight * 0.005),

                    Text(
                      'whizzie',
                      style: TextStyle(
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'ADLaMDisplay',
                        letterSpacing: 1.5,
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      'QUIZ CHALLENGE',
                      style: TextStyle(
                        fontSize: screenWidth * 0.038,
                        color: Colors.white,
                        fontFamily: 'Afacad',
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenWidth * 0.038,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5D9EE),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        controller: _nameController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: const Color(0xFFE91E93),
                          fontFamily: 'Afacad',
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your name to start the quiz',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          hintStyle: TextStyle(
                            color: const Color(0xFFE91E93).withOpacity(0.35),
                            fontSize: screenWidth * 0.035,
                            fontFamily: 'Afacad',
                          ),
                        ),
                        onSubmitted: (_) => _startQuiz(),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    SizedBox(
                      width: screenWidth * 0.5,
                      child: ElevatedButton(
                        onPressed: _startQuiz,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE91E93),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.032,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'START QUIZ',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Afacad',
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}