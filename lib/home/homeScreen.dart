import 'package:flutter/material.dart';
import 'package:islami_project_flutter/home/hadethTab/hadethTab.dart';
import 'package:islami_project_flutter/home/quranTab/quranTab.dart';
import 'package:islami_project_flutter/home/radioTab/radioTab.dart';
import 'package:islami_project_flutter/home/sebhaTab/sebhaTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project_flutter/home/setting_tab/setting.dart';
import 'package:islami_project_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [Qurantab(), Hadethtab(), Sebhatab(), Radiotab(), Setting()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.appTheme == ThemeMode.light
            ? Image.asset("assets/images/bg3.png",
            height: double.infinity, width: double.infinity, fit: BoxFit.fill)
            : Image.asset("assets/images/bg_night.png",
            height: double.infinity, width: double.infinity, fit: BoxFit.fill),
        Scaffold(
          backgroundColor: Colors.transparent, // Make scaffold background transparent to show the image
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: AppLocalizations.of(context)!.quran_tab,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/hadeth.png")),
                  label: AppLocalizations.of(context)!.hadeth_tab,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: AppLocalizations.of(context)!.sebha_tab,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: AppLocalizations.of(context)!.radio_tab,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting_tab,
                ),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
