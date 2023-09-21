import 'package:flutter/material.dart';
import 'package:islami_project/ui/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
      HomeScreen.routeName: (_) => HomeScreen(),
    },
      initialRoute: HomeScreen.routeName,
    );
  }
}
