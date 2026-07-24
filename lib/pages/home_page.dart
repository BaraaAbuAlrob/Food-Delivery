// dart

// Flutter
import 'package:flutter/material.dart';

// Other Packages

// Internal Files
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var size35 = MediaQuery.sizeOf(context).aspectRatio * 35.0;
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(left: size35, right: size35),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image(
                image: const AssetImage('assets/images/classic_burger.jpg'),
                height: isLandscape ? size.height * 0.5 : size.height * 0.23,
                width: isLandscape ? size.width * 0.6 : size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.037),
            GridView.builder(
              shrinkWrap: true,
              itemCount: food.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandscape ? 5 : 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  debugPrint(food[index].name);
                },
                child: FoodGridItem(foodIndex: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
