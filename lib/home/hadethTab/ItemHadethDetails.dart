import 'package:flutter/material.dart';
import 'package:islami_project_flutter/home/hadethTab/Hadeth_Details.dart';
import 'package:islami_project_flutter/home/quranTab/Sura_Details.dart';

import 'hadethTab.dart';

class Itemhadethdetails extends StatelessWidget {
  Hadeth hadeth;
  Itemhadethdetails({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(HadethDetails.routeName,
              arguments: hadeth
          );
        },
        child: Text(hadeth.title,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center));
  }
}
