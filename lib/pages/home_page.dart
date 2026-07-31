// dart

// Flutter
import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_item.dart';

// Other Packages

// Internal Files
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/utilities/app_assets.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

import 'package:food_delivery/ui_models/food_details_args.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                image: const AssetImage(AppAssets.burgerBanner),
                height: isLandscape ? size.height * 0.5 : size.height * 0.23,
                width: isLandscape ? size.width * 0.6 : size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.037),
            SizedBox(
              height: size.height * 0.13,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16.0),
                  child: Container(
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Image.asset(categories[index].imgPath),
                          const SizedBox(height: 8.0),
                          Text(
                            categories[index].title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
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
                  Navigator.pushNamed(
                    context,
                    FoodDetailsPage.routeName,
                    arguments: FoodDetailsArgs(foodIndex: index),
                  ).then((value) {
                    setState(() {});
                    debugPrint('The value returned in home: $value');
                  });
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
