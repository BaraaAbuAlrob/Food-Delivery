import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFavButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const AdaptiveFavButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final isIOS = !kIsWeb && Platform.isIOS;

    return isIOS
        ? CupertinoButton(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? size.width * 0.01 : 8.0,
              vertical: isLandscape ? size.height * 0.005 : 4.0,
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.heart_fill,
                  size: isLandscape ? size.height * 0.05 : size.height * 0.025,
                ),
                const SizedBox(width: 4.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize:
                        isLandscape ? size.height * 0.035 : size.height * 0.02,
                  ),
                ),
              ],
            ),
          )
        : TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? size.width * 0.01 : 8.0,
                vertical: isLandscape ? size.height * 0.005 : 4.0,
              ),
            ),
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor,
              size: isLandscape ? size.height * 0.05 : size.height * 0.028,
            ),
            onPressed: onPressed,
            label: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize:
                    isLandscape ? size.height * 0.035 : size.height * 0.02,
              ),
            ),
          );
  }
}