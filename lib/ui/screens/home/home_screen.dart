import 'package:flutter/material.dart';
import 'package:islami_project/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_project/ui/screens/home/tabs/sebha_tab/sebha_Tab.dart';
import 'package:islami_project/ui/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_theme.dart';

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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.lightModeBG), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Islami", style: AppTheme.appBarTittleTextStyle),
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
        ),
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: buildBottomNavigationBar(),
        body: tabs[tabIndex],
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconQuran)),
                label: "Quran"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconAhadeth)),
                label: "Ahadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconSebha)),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconRadio)),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings")
          ],
          // It's not working in Flutter. (bug)
          // backgroundColor: AppColors.primary,
          selectedItemColor: AppColors.accent,
          iconSize: 32,
          currentIndex: tabIndex,
          onTap: (index) {
            tabIndex = index;
            setState(() {});
          },
        ),
      );
}
