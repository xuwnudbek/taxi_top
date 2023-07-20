import 'package:flutter/material.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/asset_image_card.dart';
import 'package:taxi_top/utils/widgets/network_image_card.dart';

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
      constraints: BoxConstraints(
        maxHeight: size.height,
        minHeight: size.height - 10,
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
              maxWidth: size.height,
              maxHeight: size.height,
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
        ],
      ),
    );
  }
}
