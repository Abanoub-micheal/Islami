import 'package:flutter/material.dart';
import 'package:islamiapp_app/MyTheme.dart';
import 'package:islamiapp_app/Screens/home/hadeth/HadethDetails.dart';
import 'package:islamiapp_app/Screens/home/quran/SuraDetails.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';
import 'hadtheTab.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth ;
  ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetails.routeName,
            arguments: hadeth );
      },
      child: Text(hadeth.title,
        style:Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center ,
      ),
    );
  }
}
