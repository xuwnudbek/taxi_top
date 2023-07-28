import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taxi_top/utils/function/main_function.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/appbar_x.dart';
import 'package:taxi_top/utils/widgets/buttons/main_button.dart';
import 'package:taxi_top/utils/widgets/cards/main_card.dart';
import 'package:taxi_top/utils/widgets/cards/main_ride_card.dart';
import 'package:taxi_top/utils/widgets/cards/main_rider_card.dart';

class AboutRider extends StatelessWidget {
  AboutRider({super.key, this.rider});

  var rider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: Text(
          "about_rider".tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        isCenter: true,
        haveBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: rider['photo'] != null
                        ? Image.network(
                            rider['photo'],
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/images/person.png",
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              rider['name'] + " " + rider['surname'],
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        RatingStars(
                          value: rider['star'],
                          starColor: RGBColors.secondaryColor,
                          starBuilder: (index, color) {
                            return Icon(
                              Icons.star_rate_rounded,
                              color: color,
                              size: 20,
                            );
                          },
                          maxValue: 5,
                          starSpacing: 0,
                          onValueChanged: (value) {},
                          starSize: 17,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  //Phone and Call
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "phone".tr,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        rider['phone'],
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: RGBColors.lightColor,
                            ),
                      ),
                      MainButton(
                        height: 40,
                        color: RGBColors.success,
                        child: SvgPicture.asset(
                          "assets/images/call.svg",
                          color: RGBColors.lightColor,
                        ),
                        onTap: () {
                          MainFunc.call(rider['phone']);
                        },
                      ),
                    ],
                  ),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
