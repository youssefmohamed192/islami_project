import 'package:flutter/material.dart';
import 'package:islami_project/model/details_screen_args.dart';
import 'package:islami_project/ui/screens/details_screen/details_screen.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_theme.dart';
import 'package:islami_project/utils/constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.quranLogo)),
        const Divider(height: 3, color: AppColors.primary, thickness: 3),
        const Text("Sura Name",
            style: AppTheme.quranTabTittle, textAlign: TextAlign.center),
        const Divider(height: 3, color: AppColors.primary, thickness: 3),
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
                      style: AppTheme.quranTabTittle
                          .copyWith(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ));
              },
            ))
      ],
    );
  }
}
