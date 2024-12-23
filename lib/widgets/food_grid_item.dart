import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodGridItem extends StatelessWidget {
  final FoodItem foodItem;

  const FoodGridItem({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              foodItem.imgUrl,
              height: MediaQuery.sizeOf(context).height * 0.12,
              width: MediaQuery.sizeOf(context).height * 0.15,
              fit: BoxFit.contain,
            ),
            Text(
              foodItem.name,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$ ${foodItem.price}',
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w800,
                color: Colors.deepOrange
              ),
            ),
          ],
        ),
      ),
    );
  }
}
