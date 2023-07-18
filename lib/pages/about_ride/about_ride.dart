import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/about_ride/provider/about_ride_provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/buttons/back_buttonx.dart';

class AboutRide extends StatelessWidget {
  AboutRide(this.rideId, {super.key});

  int rideId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AboutRideProvider>(
        create: (context) => AboutRideProvider(),
        builder: (context, snapshot) {
          var ride = Provider.of<AboutRideProvider>(context).ride;

          return Scaffold(
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
                  child: Container(
                    color: RGBColors.grey,
                    child: Hero(
                      tag: "${ride['id']}_image",
                      child: Image.network(
                        "${ride['car'].photo}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
