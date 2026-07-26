import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/widgets/adaptive_fav_button.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Future<void> _showUnfavoriteDialog(
    BuildContext context,
    FoodItem item,
  ) async {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final primaryColor = Theme.of(context).primaryColor;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Row(
            children: [
              Icon(
                Icons.favorite_border,
                color: primaryColor,
                size: isLandscape ? size.height * 0.07 : size.height * 0.035,
              ),
              const SizedBox(width: 8.0),
              Text(
                'Remove Favorite',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: isLandscape
                      ? size.height * 0.05
                      : size.height * 0.024,
                ),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to remove "${item.name}" from your favorites?',
            style: TextStyle(
              fontSize: isLandscape ? size.height * 0.04 : size.height * 0.02,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: isLandscape
                      ? size.height * 0.038
                      : size.height * 0.02,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? size.width * 0.02 : 16.0,
                  vertical: isLandscape ? size.height * 0.01 : 8.0,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Remove',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isLandscape
                      ? size.height * 0.038
                      : size.height * 0.02,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      int targetedIndex = food.indexOf(item);
      if (targetedIndex != -1) {
        setState(() {
          food[targetedIndex] = food[targetedIndex].copyWith(isFavorite: false);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final favoriteFood = food
        .where((foodItem) => foodItem.isFavorite == true)
        .toList();

    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_state.png',
              fit: BoxFit.cover,
              height: isLandscape ? size.height * 0.4 : size.height * 0.25,
            ),
            const SizedBox(height: 12.0),
            Text(
              'No Favorite Items Found!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isLandscape ? size.width * 0.03 : 12.0,
        vertical: isLandscape ? size.height * 0.01 : 6.0,
      ),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder: (context, index) {
          final item = favoriteFood[index];
          final realIndex = food.indexOf(item);
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailsPage(foodIndex: realIndex),
                ),
              ).then((_) => setState(() {}));
            },
            child: Card(
              margin: EdgeInsets.symmetric(
                vertical: isLandscape ? size.height * 0.008 : 4.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? size.width * 0.02 : 12.0,
                  vertical: isLandscape ? size.height * 0.01 : 6.0,
                ),
                child: Row(
                  children: [
                    Image.network(
                      item.imgUrl,
                      height: isLandscape
                          ? size.height * 0.1
                          : size.height * 0.055,
                      width: isLandscape
                          ? size.width * 0.08
                          : size.width * 0.13,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.broken_image_rounded,
                          color: Colors.grey,
                          size: isLandscape ? size.height * 0.08 : 30,
                        );
                      },
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: isLandscape
                                ? Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontWeight: FontWeight.bold)
                                : Theme.of(context).textTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: isLandscape ? 2.0 : 4.0),
                          Text(
                            '\$ ${item.price}',
                            style: isLandscape
                                ? Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  )
                                : Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    if (!isLandscape)
                      IconButton(
                        onPressed: () => _showUnfavoriteDialog(context, item),
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size: size.height * 0.03,
                        ),
                      ),
                    if (isLandscape)
                      AdaptiveFavButton(
                        title: 'Loved',
                        onPressed: () => _showUnfavoriteDialog(context, item),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
