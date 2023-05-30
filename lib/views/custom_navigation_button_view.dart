import 'package:electronic_shop_app/services/constants/colors.dart';
import 'package:electronic_shop_app/services/constants/fonts.dart';
import 'package:flutter/material.dart';

class CustomNavigationButton extends StatelessWidget {
  final void Function(int) pressButton;
  final int currentIndex;
  final int index;
  final AssetImage icon;
  final String text;

  const CustomNavigationButton(
      {Key? key,
        required this.pressButton,
        required this.index,
        required this.currentIndex,
      required this.icon,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 5),
      child: MaterialButton(
        padding: const EdgeInsets.all(5),
        shape: const CircleBorder(),
        onPressed: () => pressButton(index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            NavigationItemImage(image: icon, isSelected: isSelected),
            const SizedBox(height: 5),
            NavigationItemText(text: text, isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class NavigationItemImage extends StatelessWidget {
  final AssetImage image;
  final bool isSelected;

  const NavigationItemImage(
      {Key? key, required this.image, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      height: 27.5,
      width: 27.5,
      color: isSelected ? CustomColors.deepPink : CustomColors.whiteGrey,
    );
  }
}

class NavigationItemText extends StatelessWidget {
  final String text;
  final bool isSelected;

  const NavigationItemText(
      {Key? key, required this.text, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Fonts.navigationItemTextStyle(
        isSelected ? CustomColors.deepPink : CustomColors.whiteGrey,
      ),
    );
  }
}