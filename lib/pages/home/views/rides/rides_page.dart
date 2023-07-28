import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/about_ride/about_ride.dart';
import 'package:taxi_top/pages/home/views/rides/provider/rides_provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/cards/main_ride_card.dart';
import 'package:taxi_top/utils/widgets/main_dropdown.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RidesProvider>(
      builder: (context, provider, _) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "from_here".tr + ":",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  MainDropdown(
                    categories: provider.regions,
                    value: provider.regionId,
                    onChange: (value) {
                      provider.changeRegion = value;
                    },
                  ),
                ],
              ),
              Expanded(
                child: RefreshIndicator(
                  edgeOffset: 7,
                  displacement: 7,
                  onRefresh: () async {
                    await provider.refresh();
                  },
                  child: _buildRideList(provider.rideList),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRideList(List<Map<String, dynamic>> rideList) {
    return ListView(
      children: [
        for (var ride in rideList)
          GestureDetector(
            onTap: () => Get.to(
              () => AboutRide(ride["id"]),
              transition: Transition.native,
              duration: Duration(milliseconds: 300),
            ),
            child: MainRideCard(
              ride: ride,
            ),
          ),
      ],
    );
  }
}
