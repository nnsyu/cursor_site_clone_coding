import 'package:flutter/material.dart';

/// 앱 전체에서 사용할 텍스트 스타일 정의
class AppTextStyles {
  // Display (128px, 96px, 80px)
  static const displayLarge = TextStyle(
    fontSize: 128,
    height: 1.2,
    letterSpacing: -1.5,
    color: Colors.white,
  );

  static const displayMedium = TextStyle(
    fontSize: 96,
    height: 1.2,
    letterSpacing: -0.75,
    color: Colors.white,
  );

  static const displaySmall = TextStyle(
    fontSize: 80,
    height: 1.2,
    letterSpacing: -0.5,
    color: Colors.white,
  );

  // Heading (64px, 48px, 32px)
  static const headingLarge = TextStyle(
    fontSize: 64,
    height: 1.3,
    letterSpacing: -0.5,
    color: Colors.white,
  );

  static const headingMedium = TextStyle(
    fontSize: 48,
    height: 1.3,
    letterSpacing: -0.25,
    color: Colors.white,
  );

  static const headingSmall = TextStyle(
    fontSize: 32,
    height: 1.3,
    letterSpacing: -0.25,
    color: Colors.white,
  );

  // Title (24px, 20px, 16px)
  static const titleLarge = TextStyle(
    fontSize: 24,
    height: 1.4,
    letterSpacing: 0.01,
    color: Colors.white,
  );

  static const titleMedium = TextStyle(
    fontSize: 20,
    height: 1.4,
    letterSpacing: 0.5,
    color: Colors.white,
  );

  static const titleSmall = TextStyle(
    fontSize: 16,
    height: 1.4,
    letterSpacing: 0,
    color: Colors.white,
  );

  // Body (16px, 14px)
  static const bodyLarge = TextStyle(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.1,
    color: Colors.white,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    height: 1.5,
    letterSpacing: 0.1,
    color: Colors.white,
  );

  // Label (14px)
  static const labelLarge = TextStyle(
    fontSize: 14,
    height: 1.4,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

/// 앱 전체에서 사용할 폰트 크기 정의
class AppFontSizes {
  // Display
  static const double d1 = 128;
  static const double d2 = 96;
  static const double d3 = 80;

  // Heading
  static const double h1 = 64;
  static const double h2 = 48;
  static const double h3 = 32;

  // Title
  static const double t1 = 24;
  static const double t2 = 20;
  static const double t3 = 16;

  // Body
  static const double b1 = 16;
  static const double b2 = 14;

  // Label
  static const double l1 = 14;
}
