class FoodItem {
  final String name;
  final String imgUrl;
  final double price;
  final bool isFavorite;

  FoodItem({
    required this.name,
    required this.imgUrl,
    required this.price,
    this.isFavorite = false,
  });

  FoodItem copyWith({
    String? name,
    String? imgUrl,
    double? price,
    bool? isFavorite,
  }) => FoodItem(
    name: name ?? this.name,
    imgUrl: imgUrl ?? this.imgUrl,
    price: price ?? this.price,
    isFavorite: isFavorite ?? this.isFavorite,
  );
}

List<FoodItem> food = [
  FoodItem(
    name: 'Cheese Burger',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/burger_sandwich/burger_sandwich_PNG4135.png',
    price: 5.99,
  ),
  FoodItem(
    name: 'Fries',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/fries/fries_PNG15.png',
    price: 2.99,
  ),
  FoodItem(
    name: 'Hot Dog',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/hot_dog/hot_dog_PNG10214.png',
    price: 3.99,
  ),
  FoodItem(
    name: 'Pizza',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/pizza/pizza_PNG43991.png',
    price: 7.99,
  ),
  FoodItem(
    name: 'Popcorn',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/038/280/636/original/ai-generated-fresh-and-delicious-butter-popcorn-isolated-on-transparent-background-free-png.png',
    price: 4.99,
  ),
  FoodItem(
    name: 'Soda',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/046/613/308/non_2x/glass-with-cola-and-ice-on-transparent-background-free-png.png',
    price: 1.99,
  ),
  FoodItem(
    name: 'Taco',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/kebab/kebab_PNG45.png',
    price: 6.99,
  ),
  FoodItem(
    name: 'Wings',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/fried_chicken/fried_chicken_PNG14104.png',
    price: 8.99,
  ),
  FoodItem(
    name: 'Fish',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/058/443/102/non_2x/roasted-fish-plate-lemon-garnish-parsley-free-png.png',
    price: 14.99,
  ),
  FoodItem(
    name: 'Pasta',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/pasta/pasta_PNG75.png',
    price: 14.99,
  ),
];
