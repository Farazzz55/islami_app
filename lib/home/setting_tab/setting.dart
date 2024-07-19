import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:islami_project_flutter/home/setting_tab/lang_bottom_sheet.dart';
import 'package:islami_project_flutter/home/setting_tab/theme_bottom_sheet.dart';
import 'package:islami_project_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                color: provider.appTheme == ThemeMode.light?
                Appcolors.primary_colors_light:Appcolors.yellow_color,                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLang=='en'?
                    AppLocalizations.of(context)!.english:
                   AppLocalizations.of(context)!.arabic,

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
              showThemeBottomSheet();

            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height*0.01,
                  horizontal: MediaQuery.of(context).size.width*0.01
              ),
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light?
              Appcolors.primary_colors_light:Appcolors.yellow_color,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appTheme==ThemeMode.light?
                    AppLocalizations.of(context)!.light_mode:
                    AppLocalizations.of(context)!.dark_mode,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),

            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05),
          Center(
            child: TextButton(onPressed: () async {
              await provider.saveSettings();
    }, child: Text('Save',style: provider.appTheme==ThemeMode.light?
            Theme.of(context).textTheme.bodyMedium:
            Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white
            )),
              style: TextButton.styleFrom(
                backgroundColor: provider.appTheme==ThemeMode.light?
                Appcolors.primary_colors_light : Appcolors.yellow_color

              )

            ),),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=>LangBottomSheet()
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
  }

}
