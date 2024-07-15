import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:islami_project_flutter/home/hadethTab/ItemHadethDetails_.dart';
import 'package:islami_project_flutter/home/hadethTab/hadethTab.dart';
import 'package:islami_project_flutter/home/quranTab/ItemSuraDetails.dart';

class HadethDetails extends StatelessWidget {
  static String routeName = 'HadethDetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset(
        "assets/images/bg3.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child:
                  Column(children: [
                    Text(args.title),
                    Divider(
                      color: Appcolors.primary_colors_light,
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
