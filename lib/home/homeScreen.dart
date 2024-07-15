import 'package:flutter/material.dart';
import 'package:islami_project_flutter/home/hadethTab/hadethTab.dart';
import 'package:islami_project_flutter/home/quranTab/quranTab.dart';
import 'package:islami_project_flutter/home/radioTab/radioTab.dart';
import 'package:islami_project_flutter/home/sebhaTab/sebhaTab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/bg3.png",
            height: double.infinity, width: double.infinity, fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran.png")),
                    label: "Quran"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/hadeth.png")),
                    label: "Hadeth"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "Radio"),
              ],
            ),
          ),
          body:
          Tabs[selectedIndex],
        )
      ],
    );
  }

  List<Widget> Tabs = [Qurantab(), Hadethtab(), Sebhatab(), Radiotab()];
}
