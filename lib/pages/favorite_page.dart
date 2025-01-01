import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final List<FoodItem> favorites =
        foods.where((food) => food.isFavorite).toList();

    return favorites.isEmpty
        ? Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/empty_state.png',
                  width: MediaQuery.sizeOf(context).width * 0.65,
                ),
                Text(
                  'No favorite items yet!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
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
                        width: MediaQuery.sizeOf(context).width * 0.2,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favorites[favIndex].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '\$ ${favorites[favIndex].price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.grey[100],
                              title: const Text('Remove from favorite?'),
                              content: const Text(
                                  'Are you sure you want to remove this item from favorite?'),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[
                                        300], // Light grey for Cancel button
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors
                                            .black), // Black text for visibility
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .primaryColor, // Red for Remove button
                                  ),
                                  onPressed: () {
                                    final targetItem = favorites[favIndex];
                                    final foodIndex = foods.indexOf(targetItem);
                                    setState(
                                      () {
                                        foods[foodIndex] = foods[foodIndex]
                                            .copyWith(isFavorite: false);
                                        favorites.removeAt(favIndex);
                                      },
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Remove',
                                    style: TextStyle(
                                        color: Colors
                                            .white), // White text for contrast
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
