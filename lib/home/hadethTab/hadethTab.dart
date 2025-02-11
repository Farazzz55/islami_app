import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:islami_project_flutter/home/hadethTab/ItemHadethDetails.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
class Hadethtab extends StatefulWidget {
  @override
  State<Hadethtab> createState() => _HadethtabState();
}

class _HadethtabState extends State<Hadethtab> {
  List<Hadeth>hadethListC=[];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    if(hadethListC.isEmpty){
    loadHadethFile();
    }
    return Column(
      children: [
        Image(image: AssetImage("assets/images/hadeth_logo.png")),
        Divider(
          color: provider.appTheme == ThemeMode.light?
          Appcolors.primary_colors_light:Appcolors.yellow_color,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: provider.appTheme == ThemeMode.light?
          Appcolors.primary_colors_light:Appcolors.yellow_color,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: hadethListC.isEmpty?
              Center(
             child: CircularProgressIndicator(
                 color: provider.appTheme == ThemeMode.light?
                 Appcolors.primary_colors_light:Appcolors.yellow_color,
             )):
          ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: provider.appTheme == ThemeMode.light?
                Appcolors.primary_colors_light:Appcolors.yellow_color,
                thickness: 2,
              );
            },
            itemBuilder: (context, index) {
              return Itemhadethdetails(hadeth:hadethListC[index]);
            },
            itemCount: hadethListC.length
          ),
        )
      ],
    );

  }

  void loadHadethFile()async{
    String hadethContent = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String>hadethList=hadethContent.split("#\r\n");
    for(int i=0; i<hadethList.length; i++){
      print(hadethList[i]);
      List<String>hadethLines=hadethList[i].split('\n');
      String title=hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth =Hadeth(title: title, content: hadethLines);
      hadethListC.add(hadeth);
      setState(() {

      });

    }
  }
}
class Hadeth{
  String title;
  List<String>content;
  Hadeth({required this.title,required this.content});
}