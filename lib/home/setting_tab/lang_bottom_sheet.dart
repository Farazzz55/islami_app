import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';

class LangBottomSheet extends StatefulWidget{
  @override
  State<LangBottomSheet> createState() => _LangBottomSheetState();
}

class _LangBottomSheetState extends State<LangBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.appTheme == ThemeMode.light?
      Appcolors.primary_colors_light:Appcolors.primary_colors_night,
      child: Padding(
        padding:  EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height*0.05,
          horizontal: MediaQuery.of(context).size.width*0.05
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){
                provider.changeAppLang("en");
              },
              child: provider.appLang=='en'? getSelectedItem(AppLocalizations.of(context)!.english):
                  unSelectedItem(AppLocalizations.of(context)!.english)),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            InkWell(
              onTap: (){
                provider.changeAppLang("ar");

              },
                child: provider.appLang=='ar'? getSelectedItem(AppLocalizations.of(context)!.arabic):
                unSelectedItem(AppLocalizations.of(context)!.arabic)),

          ],
        ),
      ),
    );
  }

  Widget getSelectedItem(String text){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color:Colors.white
        ),),
        Icon(Icons.check , size: MediaQuery.of(context).size.width*0.09,)
      ],
    );
  }
  Widget unSelectedItem(String text){
    return Text(text
      ,style: Theme.of(context).textTheme.bodyMedium,);
  }
}