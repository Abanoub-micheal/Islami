import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp_app/MyTheme.dart';
import 'package:islamiapp_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottom extends StatefulWidget {
  @override
  State<LanguageBottom> createState() => _LanguageBottomState();
}

class _LanguageBottomState extends State<LanguageBottom> {
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

              provider.changeLanguage('en');

            },

              child: provider.applanguage==('en')?
              getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  :
                  getunSelectedItemWidget(AppLocalizations.of(context)!.english)
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: (){

                provider.changeLanguage('ar');

              },
              child: provider.applanguage==('ar')?
                  getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                  :
                  getunSelectedItemWidget(AppLocalizations.of(context)!.arabic)
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
