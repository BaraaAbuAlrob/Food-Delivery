import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget ordersAndVouchersDesign({required String text, required int num}) =>
      Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.deepOrange,
              fontSize: 18.0,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            num.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );

  Widget itemsListTile(
          {required String title, required IconData icon, String? subTitle}) =>
      ListTile(
        leading: Icon(
          icon,
          size: 30.0,
          color: Colors.deepOrange,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Times New Roman',
          ),
        ),
        subtitle: subTitle != null ? Text(subTitle) : null,
        onTap: () => debugPrint('$title tapped!'),
        trailing: const Icon(
          Icons.chevron_right,
          size: 30.0,
          color: Colors.deepOrange,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 200.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/baraa_wb.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Baraa AbuAlrob',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26.0,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ordersAndVouchersDesign(text: 'Orders', num: 50),
              ordersAndVouchersDesign(text: 'Vouchers', num: 7),
            ],
          ),
          const SizedBox(height: 24.0),
          const Divider(
            indent: 16.0,
            endIndent: 16.0,
          ),
          itemsListTile(
            title: 'Past Orders',
            icon: Icons.shopping_cart,
            subTitle: 'View your past orders',
          ),
          const Divider(
            indent: 16.0,
            endIndent: 16.0,
          ),
          itemsListTile(
            title: 'Available Vouchers',
            icon: Icons.card_giftcard,
            subTitle: 'View your available vouchers',
          ),
          const Divider(
            indent: 16.0,
            endIndent: 16.0,
          ),
        ],
      ),
    );
  }
}
