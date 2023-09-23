import 'package:flutter/material.dart';
import 'package:islami_project/provider/settings_provider.dart';
import 'package:islami_project/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/sebha_tab/sebha_Tab.dart';
import 'package:islami_project/ui/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.currentTheme == ThemeMode.light
                ? AppAssets.lightModeBG
                : AppAssets.darkModeBG),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami,
              style: Theme.of(context).appBarTheme.titleTextStyle),
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: tabs[tabIndex],
      ),
    );
  }

  Widget buildBottomNavigationBar() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.iconQuran)),
              label: AppLocalizations.of(context)!.quran),
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.iconAhadeth)),
              label: AppLocalizations.of(context)!.ahadeth),
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.iconSebha)),
              label: AppLocalizations.of(context)!.sebha),
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.iconRadio)),
              label: AppLocalizations.of(context)!.radio),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings)
        ],
        // It's not working in Flutter. (bug)
        // backgroundColor: AppColors.primary,
        currentIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          setState(() {});
        },
      );
}
