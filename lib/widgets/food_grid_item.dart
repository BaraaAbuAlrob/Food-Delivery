import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorite_button.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;
  final List<FoodItem> filteredFood;

  const FoodGridItem({
    super.key,
    required this.foodIndex,
    required this.filteredFood,
  });

  @override
  Widget build(BuildContext context) {
    final targetedIndex = food.indexOf(filteredFood[foodIndex]);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        filteredFood[foodIndex].imgUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image_rounded,
                              color: Colors.grey,
                              size: 40,
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FavoriteButton(
                        foodIndex: targetedIndex,
                        height: constraints.maxHeight * 0.2,
                        width: constraints.maxWidth * 0.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: constraints.minWidth * 0.05),
              Text(
                filteredFood[foodIndex].name,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '\$ ${filteredFood[foodIndex].price}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
