import 'package:flutter/material.dart';
import 'package:islami_project_flutter/home/quranTab/Sura_Details.dart';

class ItemHadethDetailss extends StatelessWidget {
  String content;

  ItemHadethDetailss({required this.content,});

  @override
  Widget build(BuildContext context) {
    return Text(content,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center);
  }
}
