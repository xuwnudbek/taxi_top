import 'package:flutter/material.dart';
import 'package:taxi_top/pages/home/home.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foo-Bar',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: RGBColors.primaryColor,
        fontFamily: "taxitop-m",
        scaffoldBackgroundColor: RGBColors.primaryColor,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: RGBColors.secondaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            color: RGBColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        cardTheme: CardTheme(
          color: RGBColors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: Home(),
    );
  }
}
