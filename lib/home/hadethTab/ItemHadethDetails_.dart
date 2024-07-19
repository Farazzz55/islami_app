import 'package:flutter/material.dart';
import 'package:islami_project_flutter/home/quranTab/Sura_Details.dart';
import 'package:provider/provider.dart';

import '../../AppColors.dart';
import '../../provider/app_config_provider.dart';

class ItemHadethDetailss extends StatelessWidget {
  String content;

  ItemHadethDetailss({required this.content,});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Text(content,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center ,
       style: provider.appTheme==ThemeMode.light?Theme.of(context).textTheme.bodySmall:
    Theme.of(context).textTheme.bodySmall?.copyWith(
    color: Appcolors.yellow_color,
    ) );
  }
}
