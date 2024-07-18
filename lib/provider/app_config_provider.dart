import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
String appLang='en' ;
void changeAppLang(String newLang){
  if(newLang==appLang){
    return;
  } appLang=newLang;
  notifyListeners();
}

}