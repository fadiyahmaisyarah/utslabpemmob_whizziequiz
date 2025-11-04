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

    Color backgroundColor;
    Color borderColor;
    Color textColor;

    if (showResult) {

      if (isCorrect) {
        backgroundColor = const Color(0xFFB8F5CD);
        borderColor = const Color(0xFF4CAF50);
        textColor = const Color(0xFF2E7D32);
      } else if (isSelected) {
        backgroundColor = const Color(0xFFFFCDD2);
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
        onTap: showResult ? null : () => onTap(index),
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