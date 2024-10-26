import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp_app/MyTheme.dart';
import 'package:islamiapp_app/Screens/HomeScreen.dart';
import 'package:islamiapp_app/Screens/SplashScreen.dart';
import 'package:islamiapp_app/Screens/home/hadeth/HadethDetails.dart';
import 'package:islamiapp_app/Screens/home/quran/SuraDetails.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(ChangeNotifierProvider(create: (context) => AppConfigProvider(),

  child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<AppConfigProvider>(context);
     initilSharedPreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:provider.isDarkMode()?MyTheme.darktmode: MyTheme.lightmode,
      themeMode: provider.apptheme,
      locale:Locale(provider.applanguage) ,

      initialRoute: SplashScreen.routeName ,
      routes: {
        SplashScreen.routeName:(context) => SplashScreen(),
       HomeScreen.routeName:(context)=>HomeScreen(),
        SuraDetails.routeName :(context) => SuraDetails(),
        HadethDetails.routeName :(context) => HadethDetails(),


      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
  Future<void> initilSharedPreferences() async {
    final SharedPreferences prefs =await SharedPreferences.getInstance();
    var language = prefs.getString('language');
    if(language!=null) {
      provider.changeLanguage(language);
    }

    var theme = prefs.getString('theme');
    if (theme=='light') {
      provider.changeThemeMode(ThemeMode.light);
    } else {
      provider.changeThemeMode(ThemeMode.dark);
    }

  }
}

