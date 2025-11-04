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
      Color(0xFFE8078B),
      Color(0xFFD50C96),
      Color(0xFFC310A1),
      Color(0xFFA21CB3),
      Color(0xFFD70C95),
    ],
    stops: [0.0, 0.25, 0.5, 0.75, 1.0],
  );

  // Warna untuk UI elements
  static const Color cardBackground = Color(0xFFF7DBEE);
  static const Color correctGreen = Color(0xFF0DC842);
  static const Color wrongRed = Color(0xFFFF2C52);
  static const Color wrongRedLight = Color(0xFFFF5C6C);
  static const Color textPrimary = Color(0xFFEE60A1);
  static const Color textGrey = Color(0xFFAAA2A7);
}

class AppTheme {
  // Font yang akan digunakan
  static const String primaryFont = 'Afacad';
  static const String displayFont = 'ADLaMDisplay';

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.pink1,
    scaffoldBackgroundColor: AppColors.gradientStart,
    fontFamily: primaryFont,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        fontFamily: primaryFont,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        fontFamily: displayFont,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        fontFamily: primaryFont,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        fontFamily: primaryFont,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontFamily: primaryFont,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black87,
        fontFamily: primaryFont,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textGrey,
        fontFamily: primaryFont,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: primaryFont,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.pink1, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      hintStyle: const TextStyle(
        color: AppColors.textGrey,
        fontSize: 14,
        fontFamily: primaryFont,
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.cardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.white,
      linearTrackColor: Color(0x33FFFFFF),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.pink1,
    scaffoldBackgroundColor: const Color(0xFF1A1A1A),
    fontFamily: primaryFont,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        fontFamily: primaryFont,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        fontFamily: displayFont,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        fontFamily: primaryFont,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        fontFamily: primaryFont,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontFamily: primaryFont,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.white,
        fontFamily: primaryFont,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textGrey,
        fontFamily: primaryFont,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.pink1,
        foregroundColor: AppColors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: primaryFont,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2A2A2A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.pink1, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      hintStyle: const TextStyle(
        color: AppColors.textGrey,
        fontSize: 14,
        fontFamily: primaryFont,
      ),
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF2A2A2A),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.pink1,
      linearTrackColor: Color(0x33FFFFFF),
    ),
  );
}