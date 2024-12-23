import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).aspectRatio * 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image(
                  image: const AssetImage('assets/images/classic_burger.jpg'),
                  height: MediaQuery.sizeOf(context).height * 0.23,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.037,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: foods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) =>
                    FoodGridItem(foodItem: foods[index]),
              ),
            )
          ],
        ),
      );
}
