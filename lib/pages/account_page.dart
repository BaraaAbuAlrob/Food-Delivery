import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget ordersAndVouchersDesign({
    required BuildContext context,
    required String text,
    required int num,
  }) =>
      Column(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Text(
            num.toString(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      );

  Widget itemsListTile({
    required BuildContext context,
    required String title,
    required IconData icon,
    String? subTitle,
  }) =>
      ListTile(
        leading: Icon(
          icon,
          size: 30.0,
        ),
        title: Text(
          title,
        ),
        subtitle: subTitle != null ? Text(subTitle) : null,
        onTap: () => debugPrint('$title tapped!'),
        trailing: const Icon(
          Icons.chevron_right,
          size: 30.0,
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
          Text(
            'Baraa AbuAlrob',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ordersAndVouchersDesign(
                  context: context, text: 'Orders', num: 50),
              ordersAndVouchersDesign(
                  context: context, text: 'Vouchers', num: 7),
            ],
          ),
          const SizedBox(height: 24.0),
          const Divider(),
          itemsListTile(
            context: context,
            title: 'Past Orders',
            icon: Icons.shopping_cart,
            subTitle: 'View your past orders',
          ),
          const Divider(),
          itemsListTile(
            context: context,
            title: 'Available Vouchers',
            icon: Icons.card_giftcard,
            subTitle: 'View your available vouchers',
          ),
          const Divider(),
        ],
      ),
    );
  }
}
