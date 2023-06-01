import 'package:electronic_shop_app/services/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final AssetImage icon;
  final void Function()? onPressed;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: CustomColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: CustomColors.greyMiddle, width: 1)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 45,
          width: 45,
          padding: const EdgeInsets.all(9),
          child: Image(
            image: icon,
          ),
        ),
      ),
    );
  }
}