import 'package:flutter/material.dart';
import 'package:islamiapp_app/MyTheme.dart';
import 'package:islamiapp_app/Screens/home/hadeth/hadtheTab.dart';
import 'package:islamiapp_app/Screens/home/quran/quranTab.dart';
import 'package:islamiapp_app/Screens/home/radioTab.dart';
import 'package:islamiapp_app/Screens/home/sebha/sebhaTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp_app/Screens/home/settings/settingTab.dart';
import 'package:islamiapp_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectindex = 3;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.isDarkMode()?
              "assets/images/backgroundDark.png":
              "assets/images/backgroundApp.png",
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor:Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: selectindex,
            onTap: (index) {
              selectindex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/images/icon_sebha_blue.png")),
                  label:AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/iconHadthe.png")),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/images/iconQuran.png")),
                  label:AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label:AppLocalizations.of(context)!.settings)
            ],

          ),
        ),
        body: tabs[selectindex],
      ),
    );
  }

  List<Widget> tabs = [RadioTab(), SebhaTab(), HadtheTab(), QuranTab(),SettingTab()];
}
