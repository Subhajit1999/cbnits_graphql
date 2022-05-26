import 'package:cbnits_graphql/configs/size_config.dart';

class AppStatics {
  // Style Essentials
  static const String primaryFont = "Poppins";
  static const String secondaryFont = "Roboto";

  // Theme Font sizes
  static double largeHeadlineSize = 3.75 * SizeConfig.textMultiplier;
  static double mediumHeadlineSize = 3 * SizeConfig.textMultiplier;
  static double bodyTextRegularSize = 1.75 * SizeConfig.textMultiplier;
  static double bodyTextMediumSize = 2 * SizeConfig.textMultiplier;
  static double bodyTextSemiBoldSize = 2.25 * SizeConfig.textMultiplier;

  // Home page
  static double mainAppBarSize = 7 * SizeConfig.heightMultiplier;
  static double gridSpacing = 2.8 * SizeConfig.widthMultiplier;
  static double resultCardHeight = ((SizeConfig.widthMultiplier*100)-(2*2.5 * SizeConfig.heightMultiplier))/2;
  static List<String> continents = ["All", "Africa", "Antarctica", "Asia", "Europe", "North America", "Oceania", "South America"];
}