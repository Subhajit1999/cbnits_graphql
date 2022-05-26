import 'package:cbnits_graphql/configs/size_config.dart';
import 'package:cbnits_graphql/theme/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitCubeGrid(size: 4.5 * SizeConfig.heightMultiplier,
        color: AppColors.accentColor),);
  }
}
