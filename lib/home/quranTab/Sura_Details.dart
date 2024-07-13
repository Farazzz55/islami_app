import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:islami_project_flutter/home/quranTab/ItemSuraDetails.dart';

class SuraDetails extends StatefulWidget {
  static String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> Verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraArg;
    if (Verses.isEmpty) {
      loadFile(args.index);
    }
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
          body: Verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: Appcolors.primary_colors_light,
                ))
              : Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("سورة ${args.name}"),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.play_arrow),
                      ],
                    ),
                    Divider(
                      color: Appcolors.primary_colors_light,
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
