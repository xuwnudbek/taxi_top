import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/about_my_ride/edit_my_ride.dart';
import 'package:taxi_top/pages/about_my_ride/provider/about_my_ride_provider.dart';
import 'package:taxi_top/utils/cp_indicator.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/appbar_x.dart';
import 'package:taxi_top/utils/widgets/buttons/back_buttonx.dart';
import 'package:taxi_top/utils/widgets/buttons/main_button.dart';
import 'package:taxi_top/utils/widgets/cards/main_rider_card.dart';

class AboutRide extends StatelessWidget {
  AboutRide(this.rideId, {super.key});

  int rideId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AboutMyRideProvider>(
      create: (context) => AboutMyRideProvider(rideId),
      builder: (context, snapshot) {
        var ride = Provider.of<AboutMyRideProvider>(context).ride;
        var isLoading = Provider.of<AboutMyRideProvider>(context).isLoading;

        return isLoading
            ? CPIndicator()
            : Scaffold(
                appBar: AppBarX(
                  title: Hero(
                    tag: "${ride['id']}_title",
                    child: Text(
                      "${ride['from']} - ${ride['to']}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  isCenter: true,
                ),
                bottomNavigationBar: MainButton(
                  "edit_ride".tr,
                  child: Icon(Icons.send),
                  onTap: () {
                    Get.to(() => EditMyRide(id: rideId));
                  },
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Column(
                      children: [
                        //Image later may be with slider
                        Container(
                          decoration: BoxDecoration(
                            color: RGBColors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          constraints: BoxConstraints(maxHeight: 300),
                          child: Hero(
                            tag: "${ride['id']}_image",
                            child: Image.network(
                              frameBuilder: (context, child, frame,
                                  wasSynchronouslyLoaded) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: child,
                                );
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CPIndicator(),
                                  );
                                }
                              },
                              "${ride['car']['photo']}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //About Rider
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Row(
                                children: [
                                  Text("about_rider".tr),
                                ],
                              ),
                            ),
                            MainRiderCard(
                              isAsset:
                                  ride['rider']['photo'] == null ? true : false,
                              elevation: 0,
                              rider: ride['rider'],
                              size: Size(Get.width, 100),
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        ),
                        //About Ride
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Row(
                                children: [
                                  Text("about_ride".tr),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: RGBColors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "from".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Spacer(),
                                      Text("${ride['from']}"),
                                    ],
                                  ),
                                  _customDivider(),
                                  Row(
                                    children: [
                                      Text(
                                        "to".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Spacer(),
                                      Text("${ride['to']}"),
                                    ],
                                  ),
                                  _customDivider(),
                                  Row(
                                    children: [
                                      Text(
                                        "date".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Spacer(),
                                      Text("${ride['date']}"),
                                    ],
                                  ),
                                  _customDivider(),
                                  Row(
                                    children: [
                                      Text(
                                        "time".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Spacer(),
                                      Text("${ride['time']}"),
                                    ],
                                  ),
                                  _customDivider(),
                                  Row(
                                    children: [
                                      Text(
                                        "price".tr + " (so'm)",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Spacer(),
                                      Text("${ride['price']}"),
                                    ],
                                  ),
                                  _customDivider(),
                                  Row(
                                    children: [
                                      Text(
                                        "seats".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Spacer(),
                                      Text("${ride['seats']}"),
                                    ],
                                  ),
                                  _customDivider(),
                                  Row(
                                    children: [
                                      Text(
                                        "car".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Spacer(),
                                      Text("${ride['car']['model']}"),
                                    ],
                                  ),
                                  _customDivider(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Divider _customDivider() {
    return Divider(
      color: RGBColors.primaryColor,
    );
  }
}
