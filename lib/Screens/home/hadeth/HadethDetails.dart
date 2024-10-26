import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp_app/Screens/home/hadeth/hadethContent.dart';
import 'package:islamiapp_app/Screens/home/hadeth/hadtheTab.dart';
import 'package:islamiapp_app/Screens/home/quran/verses.details.dart';
import 'package:provider/provider.dart';

import '../../../MyTheme.dart';
import '../../../providers/app_config_provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName ='Hadeth-Details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  List <String> verses=[];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var arg=ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
             provider.isDarkMode()?
            "assets/images/backgroundDark.png":
            "assets/images/backgroundApp.png",
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text(arg.title
              ,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Card(
            color :provider.isDarkMode()?MyTheme.primaryDark:MyTheme.white,
            margin: EdgeInsets.symmetric(vertical: 48,horizontal: 24),
            child: ListView.builder(
              itemCount: arg.content.length,
              itemBuilder:(context, index) {
                return  HadethContent(content:arg.content[index]);
              },
            ),
          )
      ),
    );
  }

}
