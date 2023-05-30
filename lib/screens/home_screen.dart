import 'dart:io';

import 'package:electronic_shop_app/services/constants/colors.dart';
import 'package:electronic_shop_app/services/constants/fonts.dart';
import 'package:electronic_shop_app/services/constants/icons.dart';
import 'package:electronic_shop_app/services/constants/strings.dart';
import 'package:electronic_shop_app/views/custom_navigation_button_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<AssetImage> icons = [
    CustomIcons.home,
    CustomIcons.category,
    CustomIcons.heart,
    CustomIcons.profile,
  ];

  final List<String> labels = [
    Strings.home,
    Strings.category,
    Strings.interest,
    Strings.profile,
  ];

  void pressButton(int i) {
    setState(() {
      currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: MaterialButton(
                  height: 50,
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: CustomColors.greyMiddle, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Image(image: CustomIcons.search, height: 36, width: 36,),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: MaterialButton(
        padding: const EdgeInsets.all(15),
        color: CustomColors.deepPink,
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Image(
          image: CustomIcons.scan,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: BottomAppBar(
          elevation: 10,
          shadowColor: CustomColors.whiteGrey,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 4; i++)
                Expanded(
                  child: CustomNavigationButton(
                    pressButton: pressButton,
                    currentIndex: currentIndex,
                    index: i,
                    icon: icons[i],
                    text: labels[i],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
