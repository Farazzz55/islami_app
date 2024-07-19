import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';
class Radiotab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.2,),
        Image(
          image: AssetImage("assets/images/radio_logo.png",)
          ,width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*0.2,
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        Text(AppLocalizations.of(context)!.eza3a,style: Theme.of(context).textTheme.bodyMedium,),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        Image(
            image:provider.appTheme==ThemeMode.light?
            AssetImage("assets/images/play_radio.png"):
            AssetImage("assets/images/playnight.png")
          ,width: MediaQuery.of(context).size.width*0.4,
          height: MediaQuery.of(context).size.height*0.1,
        )
      ],
    );
  }
}
