import 'package:flutter/material.dart';
import 'package:islami_project/ui/screens/home/tabs/settings_tab/language_bottom_sheet.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_theme.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // to give padding by height of the screen use MediaQuery Class.
      // MediaQuery.of(context).size.height this is the height of the screen
      padding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * .1,
          right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Spacer(flex: 3),
          const Text("Language", textAlign: TextAlign.start,
              style: AppTheme.settingsTextStyle),
          const SizedBox(height: 22,),
          InkWell(
            child: getRow("English"),
            onTap: () {
              onLanguageClick(context);
            },
          ),
          const SizedBox(height: 22,),
          const Text("Mode"),
          const SizedBox(height: 22,),
          InkWell(
              child: getRow("Light"),
              // onTap: onThemeClick();
          ),
          // Spacer(flex: 7),
        ],
      ),
    );
  }

  Widget getRow(String tittle) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.primary)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tittle,
            style: const TextStyle(color: AppColors.primary, fontSize: 16),),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

  void onLanguageClick(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context){
      return  LanguageBottomSheet();
    });
  }

  onThemeClick() {

  }
}
