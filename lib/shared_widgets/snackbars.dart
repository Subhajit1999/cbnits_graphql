import 'package:another_flushbar/flushbar.dart';
import 'package:cbnits_graphql/configs/size_config.dart';
import 'package:flutter/material.dart';

class SnackBars {
  static Color? warning = Colors.yellow[700];
  static Color? success = Colors.green[700];
  static Color? error = Colors.red[700];
  static Color? info = Colors.grey[400];

  static void showFloatingSnackBar(BuildContext context, String title, String msg, Color color, IconData icon) {
    Flushbar(
      padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
      margin: EdgeInsets.all(2.5 * SizeConfig.heightMultiplier),
      borderRadius: BorderRadius.all(Radius.circular(1.1 * SizeConfig.widthMultiplier)),
      backgroundColor: color,
      icon: Icon(icon, size: 4 * SizeConfig.heightMultiplier,
        color: (color==warning || color == info)?Colors.black:Colors.white,),
      shouldIconPulse: false,
      boxShadows: [
        BoxShadow(
          color: Colors.black26,
          offset: const Offset(0, 0),
          blurRadius: 1.5 * SizeConfig.heightMultiplier,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(seconds: 2),
      isDismissible: false,

      titleText: Text(title, style: Theme.of(context).textTheme.headline5?.copyWith(
          color: (color==warning || color == info)?Colors.black:Colors.white,
          fontSize: 2.15 * SizeConfig.textMultiplier,
          fontWeight: FontWeight.bold
      )),
      messageText: Text(msg, style: Theme.of(context).textTheme.bodyText2?.copyWith(
        color: (color==warning || color == info)?Colors.black:Colors.white,
        fontSize: 1.8 * SizeConfig.textMultiplier,
      )),
    ).show(context);
  }
}