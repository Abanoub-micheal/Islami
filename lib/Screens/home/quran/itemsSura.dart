import 'package:flutter/material.dart';
import 'package:islamiapp_app/Screens/home/quran/SuraDetails.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';

class ItemSura extends StatelessWidget {
  String name;
  int index;
  ItemSura({required this.name,required this.index});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetails.routeName,arguments: SuraDetailsArg(name: name, index: index));
      },
      child: Text(name,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center ,
      ),
    );
  }
}
