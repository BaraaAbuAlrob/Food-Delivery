import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utilities/app_assets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget ordersAndVouchersDesign({
    required BuildContext context,
    required String text,
    required int num,
    required bool isLandscape,
  }) => Column(
    children: [
      Text(
        text,
        style: isLandscape
            ? Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              )
            : Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
      ),
      Text(
        num.toString(),
        style: isLandscape
            ? Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)
            : Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );

  Widget itemsListTile({
    required BuildContext context,
    required String title,
    required IconData icon,
    String? subTitle,
  }) => !kIsWeb && Platform.isAndroid
      ? ListTile(
          leading: Icon(icon, size: 30.0),
          title: Text(title),
          subtitle: subTitle != null ? Text(subTitle) : null,
          onTap: () => debugPrint('$title tapped!'),
          trailing: const Icon(Icons.chevron_right, size: 30.0),
        )
      : CupertinoListTile(
          leading: Icon(icon, size: 30.0, color: Colors.deepOrange),
          title: Text(title),
          subtitle: subTitle != null ? Text(subTitle) : null,
          onTap: () => debugPrint('$title tapped!'),
          trailing: const Icon(
            CupertinoIcons.chevron_right,
            size: 30.0,
            color: Colors.deepOrange,
          ),
        );

  Widget accountPhoto({required double height, required double width}) =>
      Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(AppAssets.profilePhoto),
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget nameText({required BuildContext context, required bool isLandscape}) =>
      Text(
        'Baraa Abu Al-Rob',
        style: isLandscape
            ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )
            : Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
      );

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if (!isLandscape) ...[
                accountPhoto(height: size.width * 0.4, width: size.width * 0.5),
                const SizedBox(height: 16.0),
                nameText(context: context, isLandscape: isLandscape),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ordersAndVouchersDesign(
                      context: context,
                      text: 'Orders',
                      num: 50,
                      isLandscape: isLandscape,
                    ),
                    ordersAndVouchersDesign(
                      context: context,
                      text: 'Vouchers',
                      num: 7,
                      isLandscape: isLandscape,
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
              ],
              if (isLandscape) ...[
                Row(
                  spacing: 32,
                  mainAxisAlignment: .start,
                  children: [
                    SizedBox(width: 8),
                    Column(
                      spacing: 16,
                      children: [
                        accountPhoto(
                          height: size.width * 0.2,
                          width: size.width * 0.2,
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    Column(
                      spacing: 24,
                      mainAxisAlignment: .spaceEvenly,
                      crossAxisAlignment: .start,
                      children: [
                        nameText(context: context, isLandscape: isLandscape),
                        Row(
                          spacing: size.width * 0.1,
                          children: [
                            ordersAndVouchersDesign(
                              context: context,
                              text: 'Orders',
                              num: 50,
                              isLandscape: isLandscape,
                            ),
                            ordersAndVouchersDesign(
                              context: context,
                              text: 'Vouchers',
                              num: 7,
                              isLandscape: isLandscape,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
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
        ),
      ),
    );
  }
}
