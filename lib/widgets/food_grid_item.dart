import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodGridItem extends StatefulWidget {
  final int foodIndex;

  const FoodGridItem({super.key, required this.foodIndex});

  @override
  State<FoodGridItem> createState() => _FoodGridItemState();
}

class _FoodGridItemState extends State<FoodGridItem> {
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
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.network(
                  foods[widget.foodIndex].imgUrl,
                  width: MediaQuery.sizeOf(context).height * 0.14,
                  fit: BoxFit.contain,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: InkWell(
                      onTap: () => setState(() {
                        foods[widget.foodIndex] =
                            foods[widget.foodIndex].copyWith(
                          isFavorite: !foods[widget.foodIndex].isFavorite,
                        );
                      }),
                      child: Icon(
                        foods[widget.foodIndex].isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              foods[widget.foodIndex].name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '\$ ${foods[widget.foodIndex].price}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
