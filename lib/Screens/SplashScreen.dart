import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp_app/MyTheme.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash-screen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: AnimatedSplashScreen(
        backgroundColor: provider.isDarkMode()?MyTheme.primaryDark:Colors.white,
          splashIconSize: 200,
          splashTransition: SplashTransition.fadeTransition,
          splash: Image.asset(provider.isDarkMode()?
            "assets/images/splashScreenDark.png"
              :
            "assets/images/iconSplash.png",
          ),
          nextScreen: HomeScreen()),
    );
  }
}
