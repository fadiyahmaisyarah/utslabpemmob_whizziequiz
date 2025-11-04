import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final String userName;
  final int score;
  final int totalQuestions;

  const ResultScreen({
    Key? key,
    required this.userName,
    required this.score,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final percentage = (score / totalQuestions * 100).round();

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kuis Selesai',
                  style: TextStyle(
                    fontSize: screenWidth * 0.065,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Afacad',
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5D9EE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Skor Anda',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: const Color(0xFFE91E93),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Afacad',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Text(
                        '$score/$totalQuestions',
                        style: TextStyle(
                          fontSize: screenWidth * 0.13,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFE91E93),
                          fontFamily: 'Afacad',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        '$percentage% Benar',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: const Color(0xFFE91E93),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Afacad',
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.04),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                            (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.038,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'MAIN LAGI',
                      style: TextStyle(
                        fontSize: screenWidth * 0.038,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFE91E93),
                        fontFamily: 'Afacad',
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.015),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                            (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.3),
                      padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.038,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'KEMBALI KE BERANDA',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Afacad',
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}