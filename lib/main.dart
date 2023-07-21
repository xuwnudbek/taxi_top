import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/controller/language/language.dart';
import 'package:taxi_top/pages/home/home.dart';
import 'package:taxi_top/pages/home/provider/home_provider.dart';
import 'package:taxi_top/pages/home/views/add_ride/provider/addRide_provider.dart';
import 'package:taxi_top/pages/home/views/profile/provider/profile_provider.dart';
import 'package:taxi_top/pages/home/views/rides/provider/rides_provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/custom_navbar/provider/navbar_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi-Top',
      translations: Messages(),
      locale: Locale('ru', 'RU'),
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: RGBColors.primaryColor,
        fontFamily: "taxitop-m",
        scaffoldBackgroundColor: RGBColors.primaryColor,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: RGBColors.secondaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(
            color: RGBColors.secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            color: RGBColors.lightColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(
            color: RGBColors.lightColor,
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
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => HomeProvider()),
            ChangeNotifierProvider(create: (context) => NavbarProvider()),
            //views
            ChangeNotifierProvider(create: (context) => RidesProvider()),
            ChangeNotifierProvider(create: (context) => AddRideProvider()),
            ChangeNotifierProvider(create: (context) => ProfileProvider()),
          ],
          builder: (context, snapshot) {
            return Home();
          }),
    );
  }
}
