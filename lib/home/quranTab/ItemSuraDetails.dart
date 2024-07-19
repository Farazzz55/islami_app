import 'package:flutter/material.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:islami_project_flutter/home/quranTab/Sura_Details.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';

class Itemsuradetails extends StatelessWidget {
  String content;
  int index;

  Itemsuradetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(SuraDetails.routeName,
              arguments: SuraArg(name: content, index: index));
        },
        child: Text("${content} (${index + 1})",
            textDirection: TextDirection.rtl,
            style: provider.appTheme==ThemeMode.light?
            Theme.of(context).textTheme.bodySmall:
            Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Appcolors.yellow_color
            ),

            textAlign: TextAlign.center));
  }
}
