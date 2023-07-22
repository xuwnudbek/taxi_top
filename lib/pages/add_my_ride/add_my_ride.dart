import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/add_my_ride/provider/add_my_ride_provider.dart';
import 'package:taxi_top/utils/cp_indicator.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/appbar_x.dart';

class AddMyRide extends StatelessWidget {
  const AddMyRide({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddMyRideProvider>(
      create: (context) => AddMyRideProvider(),
      builder: (context, snapshot) {
        var rider = Provider.of<AddMyRideProvider>(context).rider;
        return Scaffold(
          appBar: AppBarX(
            title: Text(
              "add_ride".tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Column(
                children: [
                  //Rider's car image
                  Container(
                    decoration: BoxDecoration(
                      color: RGBColors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    constraints: BoxConstraints(maxHeight: 300),
                    child: Image.network(
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: child,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CPIndicator(),
                          );
                        }
                      },
                      "${rider['car']?['photo']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  //Form ride
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
