import 'package:flutter/material.dart';

class AppColors {
  // Warna Solid
  static const Color pink1 = Color(0xFFEE60A1);
  static const Color grey = Color(0xFFAAA2A7);
  static const Color lightGreen = Color(0xFFE2FFEA);
  static const Color green = Color(0xFF0DC842);
  static const Color red = Color(0xFFFF2C52);
  static const Color lightRed = Color(0xFFFF5C6C);
  static const Color lightPink = Color(0xFFDB93A4);
  static const Color veryLightPink = Color(0xFFF7DBEE);
  static const Color white = Color(0xFFFFFFFF);

  // Warna dari gradient (untuk fallback)
  static const Color gradientStart = Color(0xFFE8078B);  // Pink
  static const Color gradientMid1 = Color(0xFFD50C96);
  static const Color gradientMid2 = Color(0xFFC310A1);
  static const Color gradientMid3 = Color(0xFFA21CB3);
  static const Color gradientEnd = Color(0xFFD70C95);    // Ungu-pink

  // Gradient untuk Background
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE8078B),  // 0% - Pink terang
      Color(0xFFD50C96),  // 50% - Pink medium
      Color(0xFFC310A1),  // 100% - Pink tua
      Color(0xFFA21CB3),  // 100% - Ungu-pink
      Color(0xFFD70C95),  // 100% - Pink-ungu
    ],
    stops: [0.0, 0.5, 1.0, 1.0, 1.0],
  );

  // Warna untuk UI elements
  static const Color cardBackground = Color(0xFFF7DBEE);  // Background card pink muda
  static const Color correctGreen = Color(0xFF0DC842);    // Jawaban benar
  static const Color wrongRed = Color(0xFFFF2C52);        // Jawaban salah
  static const Color wrongRedLight = Color(0xFFFF5C6C);   // Jawaban salah (light)
  static const Color textPrimary = Color(0xFFEE60A1);     // Text warna pink
  static const Color textGrey = Color(0xFFAAA2A7);        // Text warna abu
}