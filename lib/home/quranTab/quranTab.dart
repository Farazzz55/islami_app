import 'package:flutter/material.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:islami_project_flutter/home/quranTab/Sura_Name_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
class Qurantab extends StatelessWidget {
  List<String> SuranName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Image(image: AssetImage("assets/images/quran_logo.png")),
        Divider(
          color: provider.appTheme==ThemeMode.light?
          Appcolors.primary_colors_light:Appcolors.yellow_color,
          thickness: 3,
        ),

        Text(
          AppLocalizations.of(context)!.sura_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: provider.appTheme==ThemeMode.light?
          Appcolors.primary_colors_light:Appcolors.yellow_color,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                color: provider.appTheme==ThemeMode.light?
                Appcolors.primary_colors_light:Appcolors.yellow_color,
                thickness: 3,
              ),
            itemBuilder: (context, index) {
              return SuraNameDetails(
                name: SuranName[index],
                index: index,
              );
            },
            itemCount: SuranName.length,
          ),
        )
      ],
    );
  }
}
