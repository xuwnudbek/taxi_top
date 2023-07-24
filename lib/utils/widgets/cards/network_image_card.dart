import 'package:flutter/material.dart';
import 'package:taxi_top/utils/cp_indicator.dart';

class NetworkImageCard extends StatelessWidget {
  NetworkImageCard(
    this.imgPath, {
    super.key,
    this.size = const Size(60, 60),
    this.borderRadius = 10,
  });

  String imgPath;
  Size size;
  double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imgPath,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: child,
        ),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CPIndicator(),
          );
        },
      ),
    );
  }
}
