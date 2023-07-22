import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/home/views/rides/provider/rides_provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RidesProvider>(
      create: (context) => RidesProvider(),
      builder: (context, snapshot) {
        return Consumer<RidesProvider>(
          builder: (context, ridesProvider, _) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: ridesProvider.rideList
                      .map((e) => _buildRideCard(e))
                      .toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildRideCard(ride) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: RGBColors.grey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              ride['rider']['car']['photo'],
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
                  ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: child,
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    color: RGBColors.lightColor,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '⛳️ ${ride['from']} - ${ride['to']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
