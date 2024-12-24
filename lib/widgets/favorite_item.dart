import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoriteItem extends StatelessWidget {
  final FoodItem foodItem;

  const FavoriteItem({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) => Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.network(
            foodItem.imgUrl,
            width: MediaQuery.sizeOf(context).width * 0.2,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodItem.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$ ${foodItem.price}',
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w800,
                      color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          const Icon(Icons.favorite, color: Colors.deepOrange,)
        ],
      ),
    ),
  );
}
