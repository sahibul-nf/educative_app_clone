import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyTypography {
  static TextStyle title = GoogleFonts.nunitoSans(
    color: MyColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  // titleMedium
  static TextStyle titleMedium = GoogleFonts.nunitoSans(
    color: MyColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 22,
  );
  // titleSmall
  static TextStyle titleSmall = GoogleFonts.nunitoSans(
    color: MyColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  // body
  static TextStyle bodyLarge = GoogleFonts.nunitoSans(
    color: MyColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  // body
  static TextStyle body = GoogleFonts.nunitoSans(
    color: MyColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  // bodySmall
  static TextStyle bodySmall = GoogleFonts.nunitoSans(
    color: MyColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );
}
