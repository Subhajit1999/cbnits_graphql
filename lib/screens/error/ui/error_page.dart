import 'package:cbnits_graphql/configs/size_config.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String title, description;
  final Function onClick;
  final bool retry;

  const ErrorPage(this.title, this.description, this.retry, this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 * SizeConfig.heightMultiplier,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline5!.copyWith(
            fontSize: 2.75 * SizeConfig.textMultiplier,
            color: Colors.redAccent
          ),),

          SizedBox(height: 1.5 * SizeConfig.heightMultiplier,),
          Text(description, style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 1.85 * SizeConfig.textMultiplier
          ), textAlign: TextAlign.center,),

          retry? SizedBox(height: 3 * SizeConfig.heightMultiplier,) : const SizedBox(),
          retry? TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor
            ),
            onPressed: () => onClick(),
            child: Text('Try Again!', style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 2 * SizeConfig.textMultiplier
            ),)
          ) : const SizedBox()
        ],
      ),
    );
  }
}
