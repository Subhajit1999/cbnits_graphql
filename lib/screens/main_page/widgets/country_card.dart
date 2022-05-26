import 'package:cbnits_graphql/configs/size_config.dart';
import 'package:cbnits_graphql/models/country.dart';
import 'package:cbnits_graphql/theme/colors.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  const CountryCard(this.country, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.75 * SizeConfig.heightMultiplier),
      padding: EdgeInsets.symmetric(vertical: 0.5 * SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1.5 * SizeConfig.heightMultiplier)),
        color: AppColors.lightGreyColor
      ),

      child: ListTile(
        leading: Text(country.emoji, style: Theme.of(context).textTheme.headline4!.copyWith(
          fontSize: 5 * SizeConfig.textMultiplier
        ),),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: country.name,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 2 * SizeConfig.textMultiplier
                ),
                children: <TextSpan> [
                  const TextSpan(
                    text: ' '
                  ),
                  TextSpan(
                    text: country.code,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 1.5 * SizeConfig.textMultiplier
                    )
                  )
                ]
              )
            ),
            Text(country.continent.name, style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 1.75 * SizeConfig.textMultiplier,
              color: Colors.amber
            ),),

            SizedBox(height: 0.5 * SizeConfig.heightMultiplier,),
            Text('Currency: ${country.currency} • Country code: +${country.phoneCode}',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 1.5 * SizeConfig.textMultiplier,
              ),),
          ],
        ),
      ),
    );
  }
}
