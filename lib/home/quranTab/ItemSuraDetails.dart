import 'package:flutter/material.dart';
import 'package:islami_project_flutter/home/quranTab/Sura_Details.dart';

class Itemsuradetails extends StatelessWidget {
  String content;
  int index;

  Itemsuradetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(SuraDetails.routeName,
              arguments: SuraArg(name: content, index: index));
        },
        child: Text("${content} (${index + 1})",
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center));
  }
}
