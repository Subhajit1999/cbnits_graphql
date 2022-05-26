import 'package:cbnits_graphql/configs/size_config.dart';
import 'package:cbnits_graphql/utils/statics.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget with PreferredSizeWidget{
  final String title;

  @override
  final Size preferredSize;
  MainAppBar(this.title, {Key? key}) : preferredSize = Size.fromHeight(AppStatics.mainAppBarSize),
        super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: Theme.of(context).iconTheme,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.only(right: 10 * SizeConfig.widthMultiplier),
        child: Text(widget.title, style: Theme.of(context).textTheme.headline5!.copyWith(
            fontSize: 3 * SizeConfig.textMultiplier
        ),),
      )
    );
  }
}