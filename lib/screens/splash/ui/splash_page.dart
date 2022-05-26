import 'dart:async';

import 'package:cbnits_graphql/configs/size_config.dart';
import 'package:cbnits_graphql/utils/strings.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int splashTimeout = 2;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    // Triggers event after layout build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            _visible = true;
          });
          moveToNextRoute();
    });
  }

  void moveToNextRoute() {
    Timer(Duration(seconds: splashTimeout), () {
      Navigator.of(context).pushReplacementNamed('/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: AnimatedOpacity(
          opacity: _visible? 1 : 0,
          duration: const Duration(seconds: 1),
          child: Text(Strings.appName, style: Theme.of(context).textTheme.headline5!.copyWith(
            fontSize: 4.5 * SizeConfig.textMultiplier
          ),),
        ),
      ),
    );
  }
}