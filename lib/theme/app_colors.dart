import 'package:flutter/material.dart';

class AppColors {
  static const Color dentalTealLight = Color(0xFF33E4DB);
  static const Color dentalTealDark = Color(0xFF00BBD3);
  static const Color screenBackgroundColor = Color(0xFFF7F9FC);
  static const Color buttonBackgroundColor = Color(0xFFE9F6FE);
  static const Color textColorWhite = Colors.white;
  static const Color textColorBlack = Colors.black;
  static const Color textColorGray = Color(0x807B7B7B);
  static const Color fieldColor = Color(0xFFE9F6FE);
  static const Color cardPreviewBackground = Color(0xFFF1F3F8);
  static const Color borderColor = Color(0xFFE3E8EF);
  static const Color iconGreyColor = Color(0xB3777777);
  static const Color searchbarBackground = Color(0xFFE9EDF5);
  static const Color compliantBorderColor = Color(0x80C8C8C8);
  static const Color compliantfeildColor = Color(0xFFF5F5F5);

  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [dentalTealLight, dentalTealDark],
    stops: [0.0, 1.0],
  );
}
