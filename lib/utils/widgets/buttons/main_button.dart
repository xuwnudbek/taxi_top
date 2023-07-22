import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton(
    this.title, {
    super.key,
    required this.child,
    required this.onTap,
    this.height = 50,
  });

  Function onTap;
  String? title;
  Widget child;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.all(10),
      child: MaterialButton(
        onPressed: () => onTap(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        height: height,
        color: Theme.of(context).cardTheme.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: title != null
                  ? Text(
                      title!,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  : child,
            ),
          ],
        ),
      ),
    );
  }
}
