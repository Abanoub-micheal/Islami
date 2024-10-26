import 'package:flutter/material.dart';
import 'package:islamiapp_app/MyTheme.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';

class VersesDetails extends StatelessWidget {

  String content;
  int index;
  VersesDetails({required this.content,required this.index});

  @override
  Widget build(BuildContext context) {
    return Text('$content {${index+1}}',
      style:Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center ,
      textDirection:TextDirection.rtl ,
    );
  }
}
