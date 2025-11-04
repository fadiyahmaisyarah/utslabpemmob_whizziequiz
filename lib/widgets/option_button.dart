import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String label;
  final String text;
  final int index;
  final int correctIndex;
  final int? selectedOptionIndex;
  final bool showResult;
  final Function(int) onTap;
  final double screenWidth;

  const OptionButton({
    Key? key,
    required this.label,
    required this.text,
    required this.index,
    required this.correctIndex,
    required this.selectedOptionIndex,
    required this.showResult,
    required this.onTap,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedOptionIndex == index;
    bool isCorrect = index == correctIndex;
    return GestureDetector(
      onTap: () => onTap(index),

      child: Container(
        width: screenWidth * 0.85,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.04,
        ),
        margin: EdgeInsets.only(bottom: screenWidth * 0.03),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.green.withOpacity(0.3)
              : Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF1493),
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}