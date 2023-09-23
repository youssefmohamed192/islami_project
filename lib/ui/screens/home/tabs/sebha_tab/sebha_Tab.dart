import 'package:flutter/material.dart';
import 'package:islami_project/provider/settings_provider.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  String buttonText = 'سبحان الله';
  List<String> phrases = ['سبحان الله', 'الله اكبر', 'الحمد لله'];
  int currentPhraseIndex = 0;

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Text(AppLocalizations.of(context)!.numberoftasbih,
              textAlign: TextAlign.center),
          const Spacer(),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              onClick();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: provider.currentTheme == ThemeMode.light
                  ? AppColors.primary
                  : AppColors.accentDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12.0),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: provider.currentTheme == ThemeMode.light
                      ? AppColors.accent
                      : AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void onClick() {
    setState(() {
      if (counter < 33) {
        counter++;
      } else {
        counter = 0;
        // This allows you to cycle through the phrases continuously.
        currentPhraseIndex = (currentPhraseIndex + 1) % phrases.length;
      }
      buttonText = phrases[currentPhraseIndex];
    });
  }
}
