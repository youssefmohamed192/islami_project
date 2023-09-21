import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/model/details_screen_args.dart';
import 'package:islami_project/utils/app_colors.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "details_screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;

  String content = "";

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if (content.isEmpty) readFile();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.lightModeBG), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          title: Text(arguments.title, style: AppTheme.appBarTittleTextStyle),
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
        ),
        body: content.isEmpty ? const Center(child: CircularProgressIndicator()):
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text(content,
                style: AppTheme.detailsScreenContent,
                textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
    ;
  }

  void readFile() async {
    String file =
        await rootBundle.loadString(arguments.isQuranFile ? "assets/files/quran/${arguments.fileName}":
        "assets/files/ahadeth/${arguments.fileName}");
    content = file;
    List<String> fileLines = file.split("\n");
    for(int i = 0; i < fileLines.length;i++){
      fileLines[i] += arguments.isQuranFile ?  "(${i+1})" : " ";
    }
    content = fileLines.join();
    setState(() {});
  }
}
