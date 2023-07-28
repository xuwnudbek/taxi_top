import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  MainCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 2),
  });

  final Widget child;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        color: Theme.of(context).cardColor,
        surfaceTintColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
