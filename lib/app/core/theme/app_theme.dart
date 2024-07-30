import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get bDefaultTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xff4091a5),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4091a5)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        dialogBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: _bodyLargeTextStyle,
          bodyMedium: _bodyMediumStyle,
          bodySmall: _bodySmallStyle,
        ),
      );

  static TextStyle get _bodySmallStyle {
    return GoogleFonts.montserrat(
      fontSize: 12.sp,
      color: const Color(0xff030612),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get _bodyMediumStyle {
    return GoogleFonts.montserrat(
      fontSize: 19.sp,
      color: const Color(0xff030612),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get _bodyLargeTextStyle {
    return GoogleFonts.montserrat(
      fontSize: 27.sp,
      color: const Color(0xff030612),
      fontWeight: FontWeight.w700,
    );
  }
}
