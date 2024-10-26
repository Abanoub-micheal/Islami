import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{

 String applanguage ='ar';
 ThemeMode apptheme = ThemeMode.dark;

 void changeLanguage(String newlanguage)async {
 if(applanguage == newlanguage){
  return;
 }

  applanguage = newlanguage;

  notifyListeners();
final SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString('language', applanguage);
}
Future<void> changeThemeMode(ThemeMode newtheme) async {

  if(apptheme==newtheme)return;
  apptheme=newtheme;
  notifyListeners();
 final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('theme', apptheme==ThemeMode.dark?('dark'):('light') );
}


bool isDarkMode(){

  return apptheme==ThemeMode.dark;
}








}