import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:islami_project_flutter/home/quranTab/ItemSuraDetails.dart';
import 'package:islami_project_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> Verses = [];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraArg;
    if (Verses.isEmpty) {
      loadFile(args.index);
    }
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
          body: Verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: provider.appTheme == ThemeMode.light?
                  Appcolors.primary_colors_light:Appcolors.yellow_color,
                ))
              : Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                      color: provider.appTheme == ThemeMode.light?
                          Colors.white:Appcolors.primary_colors_night,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("سورة ${args.name}", style: provider.appTheme==ThemeMode.light?
                    Theme.of(context).textTheme.bodyMedium:
              Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Appcolors.yellow_color
          ),),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.play_arrow,color:provider.appTheme == ThemeMode.light?
                        Colors.black:Appcolors.yellow_color,),
                      ],
                    ),
                    Divider(
                      color: provider.appTheme == ThemeMode.light?
                    Appcolors.primary_colors_light:Appcolors.yellow_color,
                      thickness: 1,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Itemsuradetails(
                              content: Verses[index], index: index);
                        },
                        itemCount: Verses.length,
                      ),
                    ),
                  ]),
                ))
    ]);
  }

  void loadFile(int index) async {
    String contetnt =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> Lines = contetnt.split('\n');
    Verses = Lines;
    setState(() {});
  }
}

class SuraArg {
  String name;
  int index;

  SuraArg({required this.name, required this.index});
}
