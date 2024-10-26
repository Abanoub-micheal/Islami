import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp_app/Screens/home/quran/verses.details.dart';
import 'package:provider/provider.dart';

import '../../../MyTheme.dart';
import '../../../providers/app_config_provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName ='Sura-Details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
 List <String> verses=[];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    SuraDetailsArg arg=ModalRoute.of(context)?.settings.arguments as SuraDetailsArg;
    if(verses.isEmpty){
      loadFile(arg.index);
    }
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
      '${arg.name}',
      style:Theme.of(context).textTheme.titleLarge,
    ),
    ),
        body: verses.isEmpty?
            const Center(child: CircularProgressIndicator())
            :
            Card(
              color: provider.isDarkMode()?MyTheme.primaryDark:MyTheme.white,
              margin: EdgeInsets.symmetric(vertical: 48,horizontal: 24),
              child: ListView.separated(
                itemCount: verses.length,
                  itemBuilder:(context, index) {
                    return  VersesDetails( content:verses[index], index: index );

                  }, separatorBuilder: (BuildContext context, int index) {
                return  Divider(thickness: 2, color:MyTheme.primarylight);
              },
              ),
            )
    ),
    );
  }

  void loadFile(index) async {
    String content=(await rootBundle.loadString('assets/files/${index+1}.txt'));
     verses = content.split('\n');
     setState(() {

     });
  }
}
class SuraDetailsArg{
  String name;
  int index;
  SuraDetailsArg({required this.name,required this.index});

}
