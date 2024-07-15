import 'package:flutter/material.dart';

class Radiotab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 200,),
          Image(
            image: AssetImage("assets/images/radio_logo.png",)
            ,width: 412,
            height: 222,
          ),
          SizedBox(height: 20,),
          Text("اذاعه القرأن الكريم",style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(height: 30,),
          Image(
            image: AssetImage("assets/images/play_radio.png",)
            ,width: 194.07,
            height: 41.14,
          ),
        ],
      ),
    );
  }
}
