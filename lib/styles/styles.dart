import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryBlack = Color(0xFF252525);
  static const Color backgroundColor = Color(0xFFFFE9C8);
  static const Color primaryWhite = Color(0xFFFFFEFD);
}

var textTitleLogo = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    color: AppColors.primaryBlack);

var textCardTitle = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: AppColors.primaryBlack);

var textCardData = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0,
    color: AppColors.primaryBlack);

const textFieldDecoration = InputDecoration(
    fillColor: AppColors.primaryWhite,
    filled: true,
    labelStyle: TextStyle(
      color: Color(0xFFF3F3F3),
      fontWeight: FontWeight.w500,
    ),
    suffixIcon: Icon(Icons.search),
    hintStyle: TextStyle(color: Color(0x80444444)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlack, width: 0.0),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlack, width: 0.1),
        borderRadius: BorderRadius.all(Radius.circular(8))));

const backgroundDecoration = BoxDecoration(
  color: AppColors.backgroundColor,
  borderRadius: BorderRadius.all(Radius.circular(8)),
);


const cardBackgroundDecoration = BoxDecoration(
  color: AppColors.primaryWhite,
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

const cardShape =
RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8))
);
