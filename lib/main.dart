import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_project/provider/settings_provider.dart';
import 'package:islami_project/ui/screens/details_screen/details_screen.dart';
import 'package:islami_project/ui/screens/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return MaterialApp(
      themeMode: provider.currentTheme,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.currentLocale),
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        DetailsScreen.routeName: (_) => DetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
