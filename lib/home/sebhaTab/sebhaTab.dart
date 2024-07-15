import 'package:flutter/material.dart';

class Sebhatab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 100,),
          Stack(
            children: [
              Image(image: AssetImage("assets/images/sebha_logo.png",),width: 232,height: 234,),
              Positioned(
                child: Image(
                  image: AssetImage("assets/images/head of seb7a.png",)
                  ,width: 73,
                  height: 105,
                ),
                top: 0,
              ),

            ] ),
          SizedBox(height: 20,),
          Text("عدد التسبيحات",style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(height: 20,),
          Image(image: AssetImage("assets/images/bottom_sebha.png",),width: 137,height: 154,),

        ],
      ),
    );
  }
}
