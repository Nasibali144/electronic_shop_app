import 'dart:io';

import 'package:electronic_shop_app/services/constants/colors.dart';
import 'package:electronic_shop_app/services/constants/fonts.dart';
import 'package:electronic_shop_app/services/constants/icons.dart';
import 'package:electronic_shop_app/services/constants/images.dart';
import 'package:electronic_shop_app/services/constants/strings.dart';
import 'package:electronic_shop_app/views/custom_app_bar_view.dart';
import 'package:electronic_shop_app/views/custom_navigation_button_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int currentButtonIndex = 0;

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

  final List<AssetImage> buttonIcons = [
    CustomIcons.headphone,
    CustomIcons.mobile,
    CustomIcons.mouse,
    CustomIcons.monitor,
    CustomIcons.clock,
    CustomIcons.camera,
    CustomIcons.microphone,
  ];

  final List<String> buttonLebels = [
    Strings.headphone,
    Strings.mobile,
    Strings.mouse,
    Strings.monitor,
    Strings.clock,
    Strings.camera,
    Strings.microphone,
  ];

  void pressButton(int i) {
    setState(() {
      currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// #appbar
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// #SearchButton
                    CustomIconButton(icon: CustomIcons.search, onPressed: () {}),

                    /// #Notifications
                    Badge(
                      backgroundColor: CustomColors.deepPink,
                      largeSize: 18,
                      label: const Text('3'),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                      textColor: CustomColors.white,
                      child: CustomIconButton(
                          icon: CustomIcons.notification, onPressed: () {}),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              /// #banner
              SizedBox(
                height: 170,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    /// #content
                    Container(
                      height: 170,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: CustomColors.deepPink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.bannerTitle,
                            style: Fonts.bannerStyle(28),
                          ),
                          Text(
                            Strings.bannerContent,
                            style: Fonts.bannerStyle(15),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.white,
                                padding: const EdgeInsets.all(10),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  Strings.orderNow,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: Fonts.roboto,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.black,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: CustomColors.black,
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// #image headphone
                    Transform.scale(
                      alignment: const FractionalOffset(0.75, 0.9),
                      scale: 1.4,
                      child: const Image(
                        image: CustomImages.headphone,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              /// #category
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  Strings.popularCategory,
                  style: TextStyle(
                    color: CustomColors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: Fonts.roboto,
                    fontSize: 22.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// #button
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    const SizedBox(width: 24),

                    /// #button
                    for (int i = 0; i < 7; i++) ...[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentButtonIndex = i;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: currentButtonIndex == i
                              ? CustomColors.deepPink
                              : CustomColors.white,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: currentButtonIndex == i
                                ? BorderSide.none
                                : const BorderSide(
                                    color: CustomColors.greyMiddle,
                                    width: 1,
                                  ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: buttonIcons[i],
                              color: currentButtonIndex == i
                                  ? CustomColors.white
                                  : CustomColors.black,
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              buttonLebels[i],
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Fonts.roboto,
                                fontWeight: FontWeight.w500,
                                color: currentButtonIndex == i
                                    ? CustomColors.white
                                    : CustomColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 13),

              Card(
                color: CustomColors.white,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// #image
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.pinkAccent,
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          child: const Center(
                            child: Image(
                              image: CustomImages.headphoneFour,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      /// #content
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// step 1
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Bose QC-700",
                                  style: TextStyle(
                                      color: CustomColors.black,
                                      fontFamily: Fonts.roboto,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Material(
                                  clipBehavior: Clip.antiAlias,
                                  color: CustomColors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5),
                                  ),
                                  elevation: 2.5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      padding: const EdgeInsets.all(8),
                                      child: const Image(
                                        image: CustomIcons.heart,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),

                            /// step 2
                            const Text(
                              "Over Ear, Wireless Bluetooth Headphones with Built-In Microphone",
                              style: TextStyle(
                                  color: CustomColors.grey,
                                  fontFamily: Fonts.roboto,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            /// step3
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "\$379.00",
                                  style: TextStyle(
                                      color: CustomColors.deepPink,
                                      fontFamily: Fonts.roboto,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Material(
                                  clipBehavior: Clip.antiAlias,
                                  color: CustomColors.deepPink,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5)),
                                  elevation: 2.5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                      child: const Text(
                                        "Buy",
                                        style: TextStyle(
                                          color: CustomColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.roboto,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 13),

              Card(
                color: CustomColors.white,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// #image
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.pinkAccent,
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          child: const Center(
                            child: Image(
                              image: CustomImages.headphoneFour,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      /// #content
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// step 1
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Bose QC-700",
                                  style: TextStyle(
                                      color: CustomColors.black,
                                      fontFamily: Fonts.roboto,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Material(
                                  clipBehavior: Clip.antiAlias,
                                  color: CustomColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  elevation: 2.5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      padding: const EdgeInsets.all(8),
                                      child: const Image(
                                        image: CustomIcons.heart,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),

                            /// step 2
                            const Text(
                              "Over Ear, Wireless Bluetooth Headphones with Built-In Microphone",
                              style: TextStyle(
                                  color: CustomColors.grey,
                                  fontFamily: Fonts.roboto,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            /// step3
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "\$379.00",
                                  style: TextStyle(
                                      color: CustomColors.deepPink,
                                      fontFamily: Fonts.roboto,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Material(
                                  clipBehavior: Clip.antiAlias,
                                  color: CustomColors.deepPink,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                  elevation: 2.5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                      child: const Text(
                                        "Buy",
                                        style: TextStyle(
                                          color: CustomColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.roboto,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 13),

              Card(
                color: CustomColors.white,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// #image
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.pinkAccent,
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          child: const Center(
                            child: Image(
                              image: CustomImages.headphoneFour,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      /// #content
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// step 1
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Bose QC-700",
                                  style: TextStyle(
                                      color: CustomColors.black,
                                      fontFamily: Fonts.roboto,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Material(
                                  clipBehavior: Clip.antiAlias,
                                  color: CustomColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  elevation: 2.5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      padding: const EdgeInsets.all(8),
                                      child: const Image(
                                        image: CustomIcons.heart,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),

                            /// step 2
                            const Text(
                              "Over Ear, Wireless Bluetooth Headphones with Built-In Microphone",
                              style: TextStyle(
                                  color: CustomColors.grey,
                                  fontFamily: Fonts.roboto,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            /// step3
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "\$379.00",
                                  style: TextStyle(
                                      color: CustomColors.deepPink,
                                      fontFamily: Fonts.roboto,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Material(
                                  clipBehavior: Clip.antiAlias,
                                  color: CustomColors.deepPink,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                  elevation: 2.5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                      child: const Text(
                                        "Buy",
                                        style: TextStyle(
                                          color: CustomColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Fonts.roboto,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 13),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
