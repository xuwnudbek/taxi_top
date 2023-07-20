import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/about_ride/provider/about_ride_provider.dart';
import 'package:taxi_top/utils/cp_indicator.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/buttons/back_buttonx.dart';
import 'package:taxi_top/utils/widgets/cards/main_rider_card.dart';

class AboutRide extends StatelessWidget {
  AboutRide(this.rideId, {super.key});

  int rideId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AboutRideProvider>(
      create: (context) => AboutRideProvider(rideId),
      builder: (context, snapshot) {
        var ride = Provider.of<AboutRideProvider>(context).ride;
        var isLoading = Provider.of<AboutRideProvider>(context).isLoading;

        return isLoading
            ? CPIndicator()
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: RGBColors.transparent,
                  leading: BackButtonX(),
                  title: Hero(
                    tag: "${ride['id']}_title",
                    child: Text(
                      "${ride['from']} - ${ride['to']}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  centerTitle: true,
                ),
                body: Flex(
                  direction: Axis.vertical,
                  children: [
                    //Image with slider
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: RGBColors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          constraints: BoxConstraints(maxHeight: 300),
                          margin: EdgeInsets.all(10),
                          child: Hero(
                            tag: "${ride['id']}_image",
                            child: Image.network(
                              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
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
                              "${ride['car'].photo}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("about_rider".tr),
                              ],
                            ),
                            SizedBox(height: 5),
                            MainRiderCard(
                              isAsset: ride['rider']['photo'] == null ? true : false,
                              elevation: 0,
                              rider: ride['rider'],
                              size: Size(Get.width, 80),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text("about_ride".tr),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
