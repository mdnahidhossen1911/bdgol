import 'package:bdgol/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class BDGOLApp extends StatelessWidget {
  const BDGOLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BDGOL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
            labelLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          )),
      initialRoute: '/',
      routes: {'/': (context) => MainBottomNavScreen()},
    );
  }
}
