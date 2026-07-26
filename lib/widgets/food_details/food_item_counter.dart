import 'package:flutter/material.dart';

class FoodItemCounter extends StatefulWidget {
  const FoodItemCounter({super.key});

  @override
  State<FoodItemCounter> createState() => _FoodItemCounterState();
}

class _FoodItemCounterState extends State<FoodItemCounter> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            IconButton(
              onPressed: decrementCounter,
              icon: Column(
                mainAxisAlignment: .start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Icon(
                      Icons.minimize_rounded,
                      color: counter > 1
                          ? Theme.of(context).primaryColor
                          : Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 16.0),
            IconButton(
              onPressed: incrementCounter,
              icon: Column(
                mainAxisAlignment: .start,
                children: [
                  Icon(Icons.add, color: Theme.of(context).primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
