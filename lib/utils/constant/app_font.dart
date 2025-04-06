import 'package:flutter/material.dart';

class FontFamily {
  static const String plusJakartaSans = 'plusJakartaSans';
}

class FontWeightCustom {
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class plusJakartaTextStyle {
  static const TextStyle bold = TextStyle(
    fontFamily: FontFamily.plusJakartaSans,
    fontWeight: FontWeightCustom.bold,
  );

  static const TextStyle semiBold = TextStyle(
    fontFamily: FontFamily.plusJakartaSans,
    fontWeight: FontWeightCustom.semiBold,
  );

  static const TextStyle medium = TextStyle(
    fontFamily: FontFamily.plusJakartaSans,
    fontWeight: FontWeightCustom.medium,
  );

  static const TextStyle italic = TextStyle(
    fontFamily: FontFamily.plusJakartaSans,
    fontStyle: FontStyle.italic,
  );
}
