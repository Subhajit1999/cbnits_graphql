import 'package:cbnits_graphql/theme/colors.dart';
import 'package:cbnits_graphql/utils/statics.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // App Light Theme
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    textTheme: lightTextTheme,
    primaryIconTheme: _mainIconThemeLight,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black.withOpacity(0)),
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline4: _semiBoldLight,
    headline5: _mediumLight,
    subtitle1: _bodyTextSemiBoldLight,
    bodyText1: _bodyTextMediumLight,
    bodyText2: _bodyTextRegularLight,
    // button: _buttonTextLight,
  );

  // Text Styles (Light Theme)
  static final TextStyle _semiBoldLight = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: AppStatics.largeHeadlineSize,
    fontFamily: AppStatics.primaryFont,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle _mediumLight = TextStyle(
    color: AppColors.secondaryColor,
    fontFamily: AppStatics.primaryFont,
    fontSize: AppStatics.mediumHeadlineSize,
  );

  static final TextStyle _bodyTextRegularLight = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: AppStatics.bodyTextRegularSize,
    fontFamily: AppStatics.secondaryFont,
  );

  static final TextStyle _bodyTextMediumLight = TextStyle(
      color: AppColors.darkGreyColor,
      fontFamily: AppStatics.secondaryFont,
      fontSize: AppStatics.bodyTextMediumSize,
      fontWeight: FontWeight.w500
  );

  static final TextStyle _bodyTextSemiBoldLight = TextStyle(
    color: AppColors.darkGreyColor,
    fontFamily: AppStatics.secondaryFont,
    fontSize: AppStatics.bodyTextSemiBoldSize,
  );

  // static final TextStyle _buttonTextLight = TextStyle(
  //   color: Colors.white,
  //   fontSize: AppStatics.buttonTextSize,
  //   fontFamily: AppStatics.defaultFont,
  //   letterSpacing: 1,
  // );

  static final IconThemeData _mainIconThemeLight = IconThemeData(
    color: AppColors.lightGreyColor,
  );
}