import 'package:flutter/material.dart';
import 'package:islamiapp_app/MyTheme.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter=0;
  List<String>tasbehat=[
    'سبحان الله',
    'الحمدلله ',
    'الله اكبر',
    'لا حول ولا قوة الا بالله',
    'لا اله الا الله',
  ];
  int index=0;
  double angel =0;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left:50),
            child: Image.asset("assets/images/head of seb7a.png",color: MyTheme.yellowcolor,)),

        Center(
          child: GestureDetector(
            onTap: (){
            onTap();

          },

            child: Transform.rotate(angle: angel,
            child: Image.asset("assets/images/sebhaIcon.png",color: MyTheme.yellowcolor)),
          ),
        ),
        SizedBox(height: 15,),
        Text("عدد التسبيحات",style: MyTheme.darktmode.textTheme.titleMedium!.copyWith(color: MyTheme.yellowcolor) ),
        Container(margin: EdgeInsets.only(top: 30,left: 15),
          padding: EdgeInsets.only(top: 25),
          width: 69,
         height: 81,
          decoration: BoxDecoration( color: Color(0xffB7935F),
            borderRadius: BorderRadius.circular(25)
          ),
          child: Text("$counter",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),textAlign: TextAlign.center,),
        ),
        SizedBox(height: 10,),
        Container(
          margin: EdgeInsets.only(left: 15),
          padding: EdgeInsets.only(top: 7),
          width: 137,
          height: 51,
          decoration: BoxDecoration( color: Color(0xffB7935F),
              borderRadius: BorderRadius.circular(25)
          ),
          child: Text(tasbehat[index],style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),textAlign: TextAlign.center,),
        )

      ],
    );
  }

  void onTap() {
    counter++;
    if(counter%33==0)
      {
        index++;

      }
    if(index==tasbehat.length)
      {
        index=0;
      }
    angel+=360/33;
  setState(() {

  });

  }
}
