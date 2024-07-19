import 'package:flutter/material.dart';
import 'package:islami_project_flutter/home/homeScreen.dart';
import 'package:islami_project_flutter/home/quranTab/Sura_Details.dart';
import 'package:islami_project_flutter/myThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'home/hadethTab/Hadeth_Details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfigProvider = AppConfigProvider();
  await appConfigProvider.loadSettings();  // Load settings before running the app
  runApp(
    ChangeNotifierProvider(
      create: (context) => appConfigProvider, // Use the instance created above
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails()
      },
      theme: Mythemedata.lightTheme,
      darkTheme: Mythemedata.darkTheme,
      themeMode: provider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLang),
    );
  }
}
