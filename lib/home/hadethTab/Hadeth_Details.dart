import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:islami_project_flutter/home/hadethTab/ItemHadethDetails_.dart';
import 'package:islami_project_flutter/home/hadethTab/hadethTab.dart';
import 'package:islami_project_flutter/home/quranTab/ItemSuraDetails.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';

class HadethDetails extends StatelessWidget {
  static String routeName = 'HadethDetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider=Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      provider.appTheme == ThemeMode.light
          ? Image.asset("assets/images/bg3.png",
        height: double.infinity, width: double.infinity, fit: BoxFit.fill)
        : Image.asset("assets/images/bg_night.png",
    height: double.infinity, width: double.infinity, fit: BoxFit.fill),
      Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                      color: provider.appTheme == ThemeMode.light?
                      Colors.white:Appcolors.primary_colors_night,
                      borderRadius: BorderRadius.circular(30)),
                  child:
                  Column(children: [
                    Text(args.title,   style: provider.appTheme==ThemeMode.light?
                      Theme.of(context).textTheme.bodyMedium:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Appcolors.yellow_color)),
                    Divider(
                      color: provider.appTheme == ThemeMode.light?
                      Appcolors.primary_colors_light:Appcolors.yellow_color,
                      thickness: 1,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ItemHadethDetailss(content:args.content[index]);},
                          itemCount: args.content.length,

                      ),
                    ),
                  ]),
                ))
    ]);
  }}
