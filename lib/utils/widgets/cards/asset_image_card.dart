import 'package:flutter/material.dart';

class AssetImageCard extends StatelessWidget {
  AssetImageCard(
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
      child: Image.asset(
        imgPath,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: child,
        ),
      ),
    );
  }
}
