import 'package:flutter/material.dart';
import 'package:islami_project_flutter/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../provider/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.appTheme == ThemeMode.light?
      Appcolors.primary_colors_light:Appcolors.primary_colors_night,      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05,
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.appTheme == ThemeMode.dark
                  ? getSelectedItem(AppLocalizations.of(context)!.dark_mode)
                  : unSelectedItem(AppLocalizations.of(context)!.dark_mode),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.appTheme == ThemeMode.light
                  ? getSelectedItem(AppLocalizations.of(context)!.light_mode)
                  : unSelectedItem(AppLocalizations.of(context)!.light_mode),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
        ),
        Icon(
          Icons.check,
          size: MediaQuery.of(context).size.width * 0.09,
        ),
      ],
    );
  }

  Widget unSelectedItem(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
