import 'package:flutter/material.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

class MainRideCard extends StatelessWidget {
  const MainRideCard({super.key, required this.ride});

  final Map<String, dynamic> ride;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: RGBColors.grey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Hero(
              tag: "${ride['id']}_image",
              child: Image.network(
                ride['car'].photo,
                fit: BoxFit.cover,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: child,
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                      color: RGBColors.secondaryColor,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "${ride['id']}_title",
                  child: Text(
                    '⛳️ ${ride['from']} - ${ride['to']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '💰 ${ride['price']} so\'m',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '🕓 Bugun: ${ride['time']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
