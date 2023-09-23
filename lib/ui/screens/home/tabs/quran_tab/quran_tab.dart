import 'package:flutter/material.dart';
import 'package:islami_project/model/details_screen_args.dart';
import 'package:islami_project/provider/settings_provider.dart';
import 'package:islami_project/ui/screens/details_screen/details_screen.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.quranLogo)),
        Divider(
            height: 3,
            color: provider.currentTheme == ThemeMode.light
                ? AppColors.primary
                : AppColors.accentDark,
            thickness: 3),
        Text(AppLocalizations.of(context)!.suraname,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center),
        Divider(
            height: 3,
            color: provider.currentTheme == ThemeMode.light
                ? AppColors.primary
                : AppColors.accentDark,
            thickness: 3),
        Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount: Constants.suraNames.length,
              itemBuilder: (_, index) {
                return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                          arguments: DetailsScreenArgs(
                              title: Constants.suraNames[index],
                              fileName: "${index + 1}.txt",
                              isQuranFile: true));
                    },
                    child: Text(
                      Constants.suraNames[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ));
              },
            ))
      ],
    );
  }
}
