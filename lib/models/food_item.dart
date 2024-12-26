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
  }) =>
      FoodItem(
        name: name ?? this.name,
        imgUrl: imgUrl ?? this.imgUrl,
        price: price ?? this.price,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}

List<FoodItem> foods = [
  FoodItem(
    name: 'Cheese Burger',
    imgUrl:
        'https://th.bing.com/th/id/OIP.5Ijx_Rto-QHZT9IHvYnqRQHaE8?w=2700&h=1800&rs=1&pid=ImgDetMain',
    price: 5.99,
  ),
  FoodItem(
    name: 'Fries',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/007/871/894/non_2x/french-fries-on-white-background-photo.jpg',
    price: 2.99,
  ),
  FoodItem(
    name: 'Hot Dog',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2016/04/Hot-Dog-PNG-File.png',
    price: 3.99,
  ),
  FoodItem(
    name: 'Pizza',
    imgUrl:
        'https://brickovenclemmons.com/wp-content/uploads/2023/05/Pizza-face-left.png',
    price: 7.99,
  ),
  FoodItem(
    name: 'Popcorn',
    imgUrl:
        'https://th.bing.com/th/id/OIP.HXIyJK7oZgPy6e11bh2-0QHaHa?w=1200&h=1200&rs=1&pid=ImgDetMain',
    price: 4.99,
  ),
  FoodItem(
    name: 'Soda',
    imgUrl:
        'https://th.bing.com/th/id/OIP.ikrB_CKJ9VbZllrLmerQVAHaHa?w=1920&h=1920&rs=1&pid=ImgDetMain',
    price: 1.99,
  ),
  FoodItem(
    name: 'Taco',
    imgUrl:
        'https://th.bing.com/th/id/OIP.Bt5P5jQC7xehCxxfhXH13QHaGm?rs=1&pid=ImgDetMain',
    price: 6.99,
  ),
  FoodItem(
    name: 'Wings',
    imgUrl:
        'https://th.bing.com/th/id/R.427aec5b0c05112c75119cd4f0d3fe74?rik=l%2fu0kYbSGoUdFw&pid=ImgRaw&r=0',
    price: 8.99,
  ),
  FoodItem(
    name: 'Fish',
    imgUrl:
        'https://i.pinimg.com/originals/77/64/6d/77646d93722edd490ade3ce0b38df9ff.png',
    price: 14.99,
  ),
  FoodItem(
    name: 'Pasta',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/021/344/437/original/pasta-isolated-on-a-transparent-background-png.png',
    price: 14.99,
  ),
];
