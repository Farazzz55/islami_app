import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:islami_project_flutter/home/setting_tab/lang_bottom_sheet.dart';
import 'package:islami_project_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height*0.07,
        horizontal: MediaQuery.of(context).size.width*0.05
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language_set,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();

            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height*0.01,
                  horizontal: MediaQuery.of(context).size.width*0.01
              ),
              decoration: BoxDecoration(
                color: Appcolors.primary_colors_light,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLang=='en'?
                    AppLocalizations.of(context)!.english:
                   AppLocalizations.of(context)!.arabic,

    // Placeholder for the language setting
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01),
          Text(
            AppLocalizations.of(context)!.theme_set,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01),
          InkWell(
            onTap: (){

            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height*0.01,
                  horizontal: MediaQuery.of(context).size.width*0.01
              ),
              decoration: BoxDecoration(
                color: Appcolors.primary_colors_light,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Light', // Placeholder for the theme setting
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=>LangBottomSheet()
    );
  }
}
