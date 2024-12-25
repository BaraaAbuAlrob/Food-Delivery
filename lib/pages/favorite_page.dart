import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorite_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FoodItem> favorites = foods.where((food) => food.isFavorite).toList();
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) => FavoriteItem(
            foodItem: favorites[index],
          ),
        ),
      );
  }
}
