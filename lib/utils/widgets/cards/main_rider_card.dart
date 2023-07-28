import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:taxi_top/utils/function/main_function.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/cards/asset_image_card.dart';
import 'package:taxi_top/utils/widgets/buttons/main_circle_button.dart';
import 'package:taxi_top/utils/widgets/cards/network_image_card.dart';

class MainRiderCard extends StatelessWidget {
  MainRiderCard({
    super.key,
    this.size = const Size(120, 60),
    required this.rider,
    this.isAsset = false,
    this.padding = const EdgeInsets.all(5),
    this.elevation = 0,
  });

  Size size;
  Map<String, dynamic> rider;
  bool isAsset;
  EdgeInsets padding;
  double elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      constraints: BoxConstraints(
        // maxHeight: size.height,
        minHeight: size.height,
      ),
      decoration: BoxDecoration(
        color: RGBColors.grey,
        borderRadius: BorderRadius.circular(size.height * 1 / 5),
      ),
      padding: padding,
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: size.height - 10,
              maxHeight: size.height - 10,
            ),
            child: isAsset
                ? AssetImageCard(
                    "assets/images/person.png",
                    size: Size(size.height, size.height),
                    borderRadius: size.height * 1 / 5,
                  )
                : NetworkImageCard(
                    rider["photo"],
                    size: Size(size.height, size.height),
                    borderRadius: size.height * 1 / 5,
                  ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${rider["name"]}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ), //${rider['surname']}
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${rider['phone']}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: 5),
                      RatingStars(
                        value: rider['star'],
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
