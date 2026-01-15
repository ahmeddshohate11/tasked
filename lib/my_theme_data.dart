import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasked/app_colors.dart';


class MyThemeData {
  // lightMode
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundLightColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor),
          titleMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor
          ),
          bodyMedium: GoogleFonts.inter(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor
          ),
          bodySmall: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor
          )
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: AppColors.primaryColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyColor,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      elevation: 0,

    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: StadiumBorder(
        side: BorderSide(
          width: 7,
          color: AppColors.whiteColor),
      ),
      // RoundedRectangleBorder(
      //     side: BorderSide(
      //       width: 7,
      //      color: AppColors.whiteColor),
      //     borderRadius: BorderRadius.circular(50),
      //     ),
    ),
  );
}
