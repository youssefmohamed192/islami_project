import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_theme.dart';

class LanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Select you language", style: AppTheme.tittleLanguageBottomSheat,
              textAlign: TextAlign.center),
          const SizedBox(height: 22,),
          getLanguageRow(true, "English"),
          const SizedBox(height: 16,),
          getLanguageRow(false, "العربية")
        ],
      ),
    );
  }
  getLanguageRow( bool isSelected, String language ){
    if(isSelected){
      return Text(
       language,
       style: AppTheme.selectedLanguage,
        textAlign: TextAlign.start,
      );
    } else {
      return Text(
        language,
        style: AppTheme.selectedLanguage.copyWith(fontWeight: FontWeight.normal,color: AppColors.accent),
        textAlign: TextAlign.start,
      );
    }
  }
}
