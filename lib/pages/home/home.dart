import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/home/provider/home_provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/custom_navbar/custom_navbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
        builder: (context, child) {
          return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: RGBColors.transparent,
                title: Text(
                  'Foo App',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              body: Center(
                child: Text('Home'),
              ),
              bottomNavigationBar: CustomNavbar(),
            );
          });
        });
  }
}
