import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    this.child,
    required this.onTap,
    this.height = 50,
    this.color,
    this.margin = const EdgeInsets.all(10),
  });

  EdgeInsets margin;
  Color? color;
  Function onTap;
  String? title;
  Widget? child;
  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      child: MaterialButton(
        onPressed: () => onTap(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        height: height,
        color: color ?? Theme.of(context).cardTheme.color,
        child: child,
      ),
    );
  }
}
