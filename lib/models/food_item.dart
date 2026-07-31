class FoodItem {
  final String id;
  final String name;
  final String imgUrl;
  final double price;
  final bool isFavorite;
  final String categoryId;

  FoodItem({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    this.isFavorite = false,
    required this.categoryId,
  });

  FoodItem copyWith({
    String? id,
    String? name,
    String? imgUrl,
    double? price,
    bool? isFavorite,
    String? categoryId,
  }) => FoodItem(
    id: id ?? this.id,
    name: name ?? this.name,
    imgUrl: imgUrl ?? this.imgUrl,
    price: price ?? this.price,
    isFavorite: isFavorite ?? this.isFavorite,
    categoryId: categoryId ?? this.categoryId,
  );
}

List<FoodItem> food = [
  FoodItem(
    id: 'burger 1',
    name: 'Cheese Burger',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/burger_sandwich/burger_sandwich_PNG4135.png',
    price: 15.99,
    categoryId: '1',
  ),
  FoodItem(
    id: 'burger 2',
    name: 'Mushroom Burger',
    imgUrl:
        'https://img.pikbest.com/png-images/20241111/mushroom-swiss-burger-isolated-on-transparent-background_11078357.png!bw700',
    price: 9.99,
    categoryId: '1',
  ),
  FoodItem(
    id: 'burger 3',
    name: 'Chicken Burger',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/039/115/599/non_2x/ai-generated-chicken-burger-isolated-on-a-transparent-background-png.png',
    price: 7.99,
    categoryId: '1',
  ),
  FoodItem(
    id: 'fries 1',
    name: 'Fries',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/fries/fries_PNG15.png',
    price: 2.99,
    categoryId: '7',
  ),
  FoodItem(
    id: 'hot dog 1',
    name: 'Hot Dog',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/hot_dog/hot_dog_PNG10214.png',
    price: 3.99,
    categoryId: '7',
  ),
  FoodItem(
    id: 'pizza 1',
    name: 'Pizza',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/pizza/pizza_PNG43991.png',
    price: 7.99,
    categoryId: '2',
  ),
  FoodItem(
    id: 'popcorn 1',
    name: 'Popcorn',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/038/280/636/original/ai-generated-fresh-and-delicious-butter-popcorn-isolated-on-transparent-background-free-png.png',
    price: 4.99,
    categoryId: '7',
  ),
  FoodItem(
    id: 'soda 1',
    name: 'Soda',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/046/613/308/non_2x/glass-with-cola-and-ice-on-transparent-background-free-png.png',
    price: 1.99,
    categoryId: '7',
  ),
  FoodItem(
    id: 'taco 1',
    name: 'Taco',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/kebab/kebab_PNG45.png',
    price: 6.99,
    categoryId: '6',
  ),
  FoodItem(
    id: 'wings 1',
    name: 'Wings',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/fried_chicken/fried_chicken_PNG14104.png',
    price: 8.99,
    categoryId: '5',
  ),
  FoodItem(
    id: 'fish 1',
    name: 'Fish',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/058/443/102/non_2x/roasted-fish-plate-lemon-garnish-parsley-free-png.png',
    price: 14.99,
    categoryId: '4',
  ),
  FoodItem(
    id: 'pasta 1',
    name: 'Pasta',
    imgUrl:
        'https://images.weserv.nl/?url=pngimg.com/uploads/pasta/pasta_PNG75.png',
    price: 14.99,
    categoryId: '3',
  ),
];
