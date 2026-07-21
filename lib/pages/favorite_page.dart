import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  VoidCallback unFavoriteButtonPress({
    required List<FoodItem> favorites,
    required int favIndex,
  }) {
    return () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[100],
          title: const Text('Remove from favorite?'),
          content: const Text(
            'Are you sure you want to remove this item from favorite?',
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                // Light grey for Cancel button
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                // Red for Remove button
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                final targetItem = favorites[favIndex];
                final foodIndex = foods.indexOf(targetItem);
                setState(() {
                  foods[foodIndex] = foods[foodIndex].copyWith(
                    isFavorite: false,
                  );
                  favorites.removeAt(favIndex);
                });
                Navigator.pop(context);
              },
              child: const Text('Remove'),
            ),
          ],
        ),
      );
    };
  }

  Widget responsiveFavoriteIconButton({
    required List<FoodItem> favorites,
    required int favIndex,
    required FoodItem targetItem,
  }) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    if (isLandscape) {
      return (!kIsWeb && Platform.isAndroid)
          ? TextButton.icon(
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
                size: 30.0,
              ),
              onPressed: unFavoriteButtonPress(
                favIndex: favIndex,
                favorites: favorites,
              ),
              label: Text(
                'Loved',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          : CupertinoButton(
              onPressed: unFavoriteButtonPress(
                favIndex: favIndex,
                favorites: favorites,
              ),
              child: Row(
                spacing: 8,
                children: [
                  Icon(
                    CupertinoIcons.heart_fill,
                    color: Theme.of(context).primaryColor,
                    size: 30.0,
                  ),
                  Text(
                    "Loved",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            );
    } else {
      return (!kIsWeb && Platform.isAndroid)
          ? IconButton(
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
                size: 30.0,
              ),
              onPressed: unFavoriteButtonPress(
                favIndex: favIndex,
                favorites: favorites,
              ),
            )
          : IconButton(
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: Theme.of(context).primaryColor,
                size: 30.0,
              ),
              onPressed: unFavoriteButtonPress(
                favIndex: favIndex,
                favorites: favorites,
              ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final size = MediaQuery.sizeOf(context);
    final List<FoodItem> favorites = foods
        .where((food) => food.isFavorite)
        .toList();

    return favorites.isEmpty
        ? Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/empty_state.png',
                  width: isLandscape ? size.width * 0.2 : size.width * 0.65,
                ),
                Text(
                  'No favorite items yet!',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Colors.black),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, favIndex) => Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.network(
                        favorites[favIndex].imgUrl,
                        width: isLandscape
                            ? size.width * 0.08
                            : size.width * 0.18,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favorites[favIndex].name,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '\$ ${favorites[favIndex].price}',
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      responsiveFavoriteIconButton(
                        favIndex: favIndex,
                        favorites: favorites,
                        targetItem: favorites[favIndex],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
