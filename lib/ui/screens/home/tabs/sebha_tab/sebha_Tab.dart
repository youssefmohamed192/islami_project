import 'package:flutter/material.dart';
import 'package:islami_project/provider/settings_provider.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Column(
      children: [

      ],
    );
  }
}
// Image(image: AssetImage(provider.currentTheme == ThemeMode.light ? AppAssets.bodySebha
//     : AppAssets.bodySebhaDark),),
// Image(image: AssetImage(provider.currentTheme == ThemeMode.light ? AppAssets.headSebha
//     : AppAssets.headSebhaDark)),