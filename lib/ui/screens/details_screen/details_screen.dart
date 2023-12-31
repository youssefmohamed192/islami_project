import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/model/details_screen_args.dart';
import 'package:islami_project/provider/settings_provider.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "details_screen";

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;

  String content = "";

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if (content.isEmpty) readFile();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.currentTheme == ThemeMode.light
                ? AppAssets.lightModeBG
                : AppAssets.darkModeBG),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          title: Text(arguments.title,
              style: Theme.of(context).textTheme.bodySmall),
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
        ),
        body: content.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
      ),
    );
  }

  void readFile() async {
    String file = await rootBundle.loadString(arguments.isQuranFile
        ? "assets/files/quran/${arguments.fileName}"
        : "assets/files/ahadeth/${arguments.fileName}");
    content = file;
    List<String> fileLines = file.split("\n");
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += arguments.isQuranFile ? "(${i + 1})" : " ";
    }
    content = fileLines.join();
    setState(() {});
  }
}
