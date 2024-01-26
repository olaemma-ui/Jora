import 'package:flutter/material.dart';
import 'package:jora_test/core/constants/app_colors.dart';

class AppTheme {
  static get theme => ThemeData(
        scaffoldBackgroundColor: AppColor.scaffoldBackground,
        useMaterial3: true,
        primaryColor: AppColor.primary,
        primarySwatch: Colors.pink,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w700,
            fontFamily: 'Work Sans',
          ),
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            fontFamily: 'Work Sans',
          ),
          displayMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'Work Sans',
          ),
          bodyMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: 'Work Sans',
          ),
          labelMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Work Sans',
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            letterSpacing: .0,
            fontWeight: FontWeight.w500,
            fontFamily: 'Work Sans',
          ),
          labelSmall: TextStyle(
            fontSize: 12,
            letterSpacing: .1,
            fontWeight: FontWeight.w400,
            fontFamily: 'Work Sans',
          ),
          displaySmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily: 'Work Sans',
          ),
        ),
      );
}
