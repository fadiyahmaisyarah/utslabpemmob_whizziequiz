import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  final String userName;

  const QuizScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF1493),
        title: Text(
          'Welcome, $userName!',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xFFFFE4EC),
      body: Center(
        child: Text(
          'Hello $userName 👋\nYour quiz will start soon!',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF1493),
          ),
        ),
      ),
    );
  }
}
