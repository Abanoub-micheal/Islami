import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../../MyTheme.dart';

class themeBottom extends StatefulWidget {
  @override
  State<themeBottom> createState() => _LanguageBottomState();
}

class _LanguageBottomState extends State<themeBottom> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){

              provider.changeThemeMode(ThemeMode.light);

            },

              child: provider.apptheme==ThemeMode.light?
              getSelectedItemWidget(AppLocalizations.of(context)!.light)
                  :
                  getunSelectedItemWidget(AppLocalizations.of(context)!.light)
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: (){

                provider.changeThemeMode(ThemeMode.dark);

              },
              child: provider.apptheme==ThemeMode.dark?
                  getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  :
                  getunSelectedItemWidget(AppLocalizations.of(context)!.dark)
              ,
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      children: [
        Text(
          text,
          style: provider.isDarkMode()? Theme.of(context).textTheme.titleSmall:Theme.of(context).textTheme.titleMedium
        ),
        const Spacer(),
        Icon(Icons.check,color:provider.isDarkMode()?MyTheme.yellowcolor: MyTheme.blackcolor,)
      ],
    );
  }

  Widget getunSelectedItemWidget(String text){
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
