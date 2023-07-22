import 'package:flutter/material.dart';

class MainBottomsheet extends StatelessWidget {
  MainBottomsheet({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: child,
    );
  }
}
