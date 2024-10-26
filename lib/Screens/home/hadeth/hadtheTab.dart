import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp_app/Screens/home/hadeth/itemshadethname.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../MyTheme.dart';
import '../../../providers/app_config_provider.dart';

class HadtheTab extends StatefulWidget {
  @override
  State<HadtheTab> createState() => _HadtheTabState();
}

class _HadtheTabState extends State<HadtheTab> {
  List<Hadeth> hadethlist = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if(hadethlist.isEmpty){
      loadingAhadeth();
    }

    return Center(
      child: Column(
        children: [
          Center(
            child: Image.asset('assets/images/hadethPhoto.png'),
          ),
          Divider(thickness: 4, color:provider.isDarkMode()?MyTheme.yellowcolor:MyTheme.primarylight),
          Text(AppLocalizations.of(context)!.hadeth_name, style:Theme.of(context).textTheme.titleLarge),
          Divider(thickness: 4,color:provider.isDarkMode()?MyTheme.yellowcolor:MyTheme.primarylight
          ),
          hadethlist.isEmpty ?
          Center(child: CircularProgressIndicator(
            color:provider.isDarkMode()?MyTheme.yellowcolor:MyTheme.primarylight,
          ))
              :
          Expanded(

                  child: ListView.separated(
                    itemCount: hadethlist.length,
                    itemBuilder: (context, index) {
                      return ItemHadethName( hadeth:hadethlist[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(thickness: 2, color:provider.isDarkMode()?MyTheme.yellowcolor:MyTheme.primarylight);
                    },
                  ),
                )
        ],
      ),
    );
  }

  void loadingAhadeth() async {
    String ahadth = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethlist = ahadth.split('#\r\n');
    for (int i = 0; i < ahadethlist.length; i++) {
      print(ahadethlist[i]);
      print('-----------------------');
      List<String> ahadethlines = ahadethlist[i].split('\n');
      String title = ahadethlines[0];
      ahadethlines.removeAt(0);

      Hadeth hadeth = Hadeth(title: title, content: ahadethlines);
      hadethlist.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
