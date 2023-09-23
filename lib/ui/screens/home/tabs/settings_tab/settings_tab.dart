import 'package:flutter/material.dart';
import 'package:islami_project/provider/settings_provider.dart';
import 'package:islami_project/ui/screens/home/tabs/settings_tab/language_bottom_sheet.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    bool switchValue = false;

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
          Text(AppLocalizations.of(context)!.language, textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 22,),
          InkWell(
            child: getRow(provider.currentLocale == "en" ? "English" : "العربية",context),
            onTap: () {
              onLanguageClick(context);
            },
          ),
          const SizedBox(height: 22,),
          Row(
            children: [
              Text("Dark Mode",textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge),
               Spacer(),
              Switch(
                  value: switchValue,
                  onChanged: (newSwitchValue){
                    switchValue = newSwitchValue;
                    if(switchValue){
                      provider.changeModeTheme(ThemeMode.dark);
                    }else{
                      provider.changeModeTheme(ThemeMode.light);
                    }
                  }
              ),
            ],
          )
          // Spacer(flex: 7),
        ],
      ),
    );
  }

  Widget getRow(String tittle,BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: provider.currentTheme == ThemeMode.light ?
          AppColors.primary : AppColors.primaryDark)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tittle,
            style:  TextStyle(color: provider.currentTheme == ThemeMode.light ?
            AppColors.primary : AppColors.primaryDark, fontSize: 16),),
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
}
