import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp_app/MyTheme.dart';
import 'package:islamiapp_app/Screens/home/settings/Languagebottom.dart';
import 'package:islamiapp_app/Screens/home/settings/themebottom.dart';
import 'package:islamiapp_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showlanguagebottom();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(provider.applanguage=='en'?
                        AppLocalizations.of(context)!.english
                        :
                        AppLocalizations.of(context)!.arabic
                        ,
                        style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                     Icon(
                      Icons.arrow_drop_down,
                      color: provider.isDarkMode()?MyTheme.white:MyTheme.blackcolor,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: (){
                  showThemeBottom();
                },
                child: Row(
                  children: [
                    Text(provider.isDarkMode()? AppLocalizations.of(context)!.dark: AppLocalizations.of(context)!.light,
                        style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                     Icon(
                      Icons.arrow_drop_down,
                      color: provider.isDarkMode()?MyTheme.white:MyTheme.blackcolor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showlanguagebottom() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottom());
  }

  void showThemeBottom() {
    showModalBottomSheet(context: context, builder:(context) => themeBottom());

  }

}
