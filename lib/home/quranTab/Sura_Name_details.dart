import 'package:flutter/material.dart';
import 'package:islami_project_flutter/home/quranTab/Sura_Details.dart';

class SuraNameDetails extends StatelessWidget {
  String name;
  int index;

  SuraNameDetails({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(SuraDetails.routeName,
              arguments: SuraArg(name: name, index: index));
        },
        child: Text(name,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center));
  }
}
