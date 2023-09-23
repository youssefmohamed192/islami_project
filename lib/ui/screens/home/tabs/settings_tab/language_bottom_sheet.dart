import 'package:flutter/material.dart';
import 'package:islami_project/provider/settings_provider.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.selectyourlanguage,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 22,
            ),
            InkWell(
              child: getLanguageRow(
                  provider.currentLocale == "en", "English", context),
              onTap: () {
                provider.changeCurrentLocale("en");
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              child: getLanguageRow(
                  provider.currentLocale == "ar", "العربية", context),
              onTap: () {
                provider.changeCurrentLocale("ar");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  getLanguageRow(bool isSelected, String language, BuildContext context) {
    if (isSelected) {
      return Text(
        language,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.start,
      );
    } else {
      return Text(
        language,
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: TextAlign.start,
      );
    }
  }
}
