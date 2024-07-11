import 'package:flutter/material.dart';
import 'package:islami_project_flutter/home/homeScreen.dart';
import 'package:islami_project_flutter/myThemeData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
      theme: Mythemedata.lightTheme,
    );
  }
}
