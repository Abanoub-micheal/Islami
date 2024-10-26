import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Expanded(
              flex:1,
          child: Image.asset('assets/images/radioPhoto.png')),
        SizedBox(height: 20,),
        Text('اذاعة القران الكريم',style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(height: 20,),

        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/Iconplay1Dark.png'),
              Image.asset('assets/images/Iconplay2Dark.png'),
              Image.asset('assets/images/Iconplay3Dark.png'),
            ],
          ),
        )



      ],
    );
  }
}
