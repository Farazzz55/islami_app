import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          Text(AppLocalizations.of(context)!.eza3a,style: Theme.of(context).textTheme.bodyMedium,),
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
