import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/about_ride/provider/about_ride_provider.dart';
import 'package:taxi_top/pages/about_rider/about_rider.dart';
import 'package:taxi_top/utils/cp_indicator.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/appbar_x.dart';
import 'package:taxi_top/utils/widgets/buttons/main_button.dart';
import 'package:taxi_top/utils/widgets/cards/main_rider_card.dart';

class AboutRide extends StatelessWidget {
  AboutRide(this.rideId, {super.key});

  int rideId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AboutRideProvider>(
      create: (context) => AboutRideProvider(rideId),
      builder: (context, snapshot) {
        return Consumer<AboutRideProvider>(builder: (context, provider, _) {
          var isLoading = provider.isLoading;
          var ride = provider.ride;

          return isLoading
              ? CPIndicator()
              : Scaffold(
                  appBar: AppBarX(
                    title: Text(
                      "${ride['from']} - ${ride['to']}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    isCenter: true,
                  ),
                  extendBody: true,
                  bottomNavigationBar: MainButton(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    color: RGBColors.secondaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "order_ride".tr,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: RGBColors.lightColor,
                              ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      print("Buyurtma berildi");
                    },
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Column(
                        children: [
                          //Image later may be with slider
                          Container(
                            decoration: BoxDecoration(
                              color: RGBColors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            constraints: BoxConstraints(maxHeight: 300),
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
                              "${ride['rider']['car']['photo']}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          //About Rider
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
                              GestureDetector(
                                onTap: () => Get.to(
                                  () => AboutRider(rider: ride['rider']),
                                  transition: Transition.native,
                                  duration: Duration(milliseconds: 300),
                                ),
                                child: MainRiderCard(
                                  isAsset: ride['rider']['photo'] == null ? true : false,
                                  elevation: 0,
                                  rider: ride['rider'],
                                  size: Size(Get.width, 100),
                                  padding: EdgeInsets.all(5),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          //About Ride
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
                                          style: Theme.of(context).textTheme.titleMedium,
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
                                          style: Theme.of(context).textTheme.titleMedium,
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
                                          style: Theme.of(context).textTheme.titleMedium,
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
                                          style: Theme.of(context).textTheme.titleMedium,
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
                                          style: Theme.of(context).textTheme.titleMedium,
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
                                          style: Theme.of(context).textTheme.titleMedium,
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
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                        Spacer(),
                                        Text("${ride['rider']['car']['model']}"),
                                      ],
                                    ),
                                    _customDivider(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          //Select Seat
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("select_seat".tr),
                                    _buildSliderButton(
                                      provider.isSingle,
                                      onChange: (value) {
                                        provider.isSingle = value;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              CarSeats(provider: provider),
                            ],
                          ),
                          SizedBox(height: 150),
                        ],
                      ),
                    ),
                  ),
                );
        });
      },
    );
  }

  Widget _buildSliderButton(bool isSingle, {required Function onChange}) {
    return GestureDetector(
      onTap: () {
        onChange(!isSingle);
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: 70),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: RGBColors.lightColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: AnimatedAlign(
          alignment: isSingle ? Alignment.centerLeft : Alignment.centerRight,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: SvgPicture.asset(
            "assets/images/${isSingle ? "man" : "mans"}.svg",
            color: RGBColors.grey,
            width: 25,
          ),
          // mainAxisAlignment: isSingle ? MainAxisAlignment.start : MainAxisAlignment.end,
          // children: [

          // ],
        ),
      ),
    );
  }

  Divider _customDivider() {
    return Divider(
      color: RGBColors.primaryColor,
    );
  }
}

class CarSeats extends StatelessWidget {
  AboutRideProvider provider;

  CarSeats({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    //Front seats
    Widget _buildFrontSeat(int index, {required Widget child}) {
      return GestureDetector(
        onTap: () {
          if (index == 0) return;
          print(provider.seatsStatus);
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: RGBColors.grey,
            borderRadius: BorderRadius.only(
              topLeft: index == 0 ? Radius.circular(70) : Radius.circular(20),
              topRight: index == 1 ? Radius.circular(70) : Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: child,
          ),
        ),
      );
    }

    //Back seats
    Widget _buildBackSeat(int index, {required Widget child}) {
      return GestureDetector(
        onTap: () {
          var seat = provider.seatsStatus[index];
          if (seat == null) {}
        },
        child: Container(
          height: 100,
          margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: RGBColors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: child,
          ),
        ),
      );
    }

    //
    return Container(
      width: Get.width * 0.5,
      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: RGBColors.lightColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(80),
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildFrontSeat(
                  0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/rider.png",
                        width: 70,
                      ),
                      Positioned(
                        bottom: -25,
                        child: Image.asset(
                          "assets/images/wheel.png",
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: _buildFrontSeat(
                  1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/passenger.png",
                        width: 50,
                      ),
                      Positioned(
                        child: SvgPicture.asset(
                          "assets/images/${provider.seatsStatus[1] ?? false ? "check" : "cross"}.svg",
                          color: provider.seatsStatus[1] ?? false ? Colors.green : Colors.red,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 2; i < provider.seatsStatus.length + 1; i++) ...[
                Expanded(
                  child: _buildBackSeat(
                    i,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/images/passenger.png",
                          width: 50,
                        ),
                        Positioned(
                          child: SvgPicture.asset(
                            "assets/images/${provider.seatsStatus[i] ?? false ? "check" : "cross"}.svg",
                            color: provider.seatsStatus[i] ?? false ? Colors.green : Colors.red,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
