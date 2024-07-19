import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';

class Sebhatab extends StatefulWidget {
  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> {
  int count = 0;
  List<String> doaa = ['سبحان الله', 'الحمدلله', 'لا اله الا الله', 'الله اكبر', 'استغفر الله'];
  double turn = 0;
  late String kelma;

  void initState() {
    super.initState();
    kelma = doaa[0];
  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedRotation(
            turns: turn,
            duration: Duration(seconds: 0),
            child: InkWell(
              onTap: () {
                setState(() {
                  turn += 1 / 4;
                  onClick();
                });
              },
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.061),
                      child:  Image(image:provider.appTheme==ThemeMode.light?
                        AssetImage("assets/images/head of seb7a.png"):
                        AssetImage("assets/images/head of seb7a night.png"),
                        width: MediaQuery.of(context).size.width * 2.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
                  ),
                  Center(
                    child: Image(
                      image:provider.appTheme==ThemeMode.light?
                      AssetImage("assets/images/sebha_logo.png"):
                  AssetImage("assets/images/body of seb7a night.png"),
    width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.number_of_sebha,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Stack(
            alignment: Alignment.center,
            children: [
              Image(image:provider.appTheme==ThemeMode.light?
              AssetImage("assets/images/numberBotton.png"):
              AssetImage("assets/images/rec number night.png"),),
              Text(
                "$count",
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Stack(
            alignment: Alignment.center,
            children: [
              Image(image:provider.appTheme==ThemeMode.light?
              AssetImage("assets/images/TextBotton.png"):
              AssetImage("assets/images/Rectangle night.png"),),
              Text(
                '$kelma',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: provider.appTheme==ThemeMode.light?
                  Colors.white:Appcolors.BlackColor
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onClick() {
    count++;
    if (count == 33) {
      int index = (doaa.indexOf(kelma) + 1) % doaa.length;
      kelma = doaa[index];
      count = 0;
    }
  }
}
