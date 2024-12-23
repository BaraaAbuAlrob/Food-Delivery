class FoodItem {
  final String name;
  final String imgUrl;
  final double price;

  FoodItem({required this.name, required this.imgUrl, required this.price});
}


List<FoodItem> foods = [
  FoodItem(
    name: 'Cheese Burger',
    imgUrl: 'https://th.bing.com/th/id/OIP.5Ijx_Rto-QHZT9IHvYnqRQHaE8?w=2700&h=1800&rs=1&pid=ImgDetMain',
    price: 5.99,
  ),
  FoodItem(
    name: 'Fries',
    imgUrl: 'https://static.vecteezy.com/system/resources/previews/007/871/894/non_2x/french-fries-on-white-background-photo.jpg',
    price: 2.99,
  ),
  FoodItem(
    name: 'Hot Dog',
    imgUrl: 'https://www.pngall.com/wp-content/uploads/2016/04/Hot-Dog-PNG-File.png',
    price: 3.99,
  ),
  FoodItem(
    name: 'Pizza',
    imgUrl: 'https://brickovenclemmons.com/wp-content/uploads/2023/05/Pizza-face-left.png',
    price: 7.99,
  ),
  FoodItem(
    name: 'Popcorn',
    imgUrl: 'https://th.bing.com/th/id/OIP.HXIyJK7oZgPy6e11bh2-0QHaHa?w=1200&h=1200&rs=1&pid=ImgDetMain',
    price: 4.99,
  ),
  FoodItem(
    name: 'Soda',
    imgUrl: 'https://th.bing.com/th/id/OIP.ikrB_CKJ9VbZllrLmerQVAHaHa?w=1920&h=1920&rs=1&pid=ImgDetMain',
    price: 1.99,
  ),
];