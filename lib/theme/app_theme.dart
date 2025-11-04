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

  // Warna gradient sesuai desain (Pink ke Ungu)
  static const Color gradientTop = Color(0xFFE91E93);      // Pink terang
  static const Color gradientMiddle = Color(0xFFB721B7);   // Magenta-Ungu
  static const Color gradientBottom = Color(0xFF8E24AA);   // Ungu

  // Gradient untuk Background - Horizontal (Kiri ke Kanan)
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFE91E93),  // Pink cerah di kiri
      Color(0xFFD61FA8),  // Pink-magenta
      Color(0xFFB721B7),  // Magenta-ungu tengah
      Color(0xFF9D23C5),  // Ungu-magenta
      Color(0xFF8E24AA),  // Ungu di kanan
    ],
    stops: [0.0, 0.25, 0.5, 0.75, 1.0],
  );

  // Gradient alternatif untuk variasi
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFE91E93),
      Color(0xFFB721B7),
    ],
  );

  // Warna untuk UI elements
  static const Color cardBackground = Color(0xFFFDF5FB);
  static const Color correctGreen = Color(0xFF0DC842);
  static const Color wrongRed = Color(0xFFFF2C52);
  static const Color wrongRedLight = Color(0xFFFF5C6C);
  static const Color textPrimary = Color(0xFFE91E93);
  static const Color textGrey = Color(0xFFAAA2A7);
  static const Color textLight = Color(0xFFF5D9ED);
}

class AppTheme {
  // Font yang akan digunakan
  static const String primaryFont = 'Afacad';
  static const String displayFont = 'ADLaMDisplay';

  // Light Theme dengan Gradient Background
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.pink1,
    scaffoldBackgroundColor: Colors.transparent, // Transparent untuk gradient
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
        letterSpacing: 1.2,
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
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        fontFamily: primaryFont,
        letterSpacing: 2.0,
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
        color: AppColors.textLight,
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
          letterSpacing: 1.5,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.white,
        side: const BorderSide(color: AppColors.white, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: primaryFont,
          letterSpacing: 1.5,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white.withOpacity(0.9),
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
        borderSide: const BorderSide(color: AppColors.white, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      hintStyle: TextStyle(
        color: AppColors.textGrey.withOpacity(0.6),
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

  // Dark Theme dengan Gradient Background
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.pink1,
    scaffoldBackgroundColor: Colors.transparent,
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
        letterSpacing: 1.2,
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
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        fontFamily: primaryFont,
        letterSpacing: 2.0,
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
        color: AppColors.textLight,
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
          letterSpacing: 1.5,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.white,
        side: const BorderSide(color: AppColors.white, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: primaryFont,
          letterSpacing: 1.5,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white.withOpacity(0.9),
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
        borderSide: const BorderSide(color: AppColors.white, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      hintStyle: TextStyle(
        color: AppColors.textGrey.withOpacity(0.6),
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
      color: AppColors.white,
      linearTrackColor: Color(0x33FFFFFF),
    ),
  );
}

class GradientBackground extends StatelessWidget {
  final Widget child;
  final LinearGradient? gradient;

  const GradientBackground({
    Key? key,
    required this.child,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient ?? AppColors.primaryGradient,
      ),
      child: child,
    );
  }
}