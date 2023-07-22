import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/about_my_ride/provider/edit_my_ride_provider.dart';
import 'package:taxi_top/utils/widgets/appbar_x.dart';

class EditMyRide extends StatelessWidget {
  EditMyRide({super.key, required this.id});

  int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditMyRideProvider>(
      create: (context) => EditMyRideProvider(id),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBarX(
            title: Text(
              "edit_ride".tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: Column(),
        );
      },
    );
  }
}
