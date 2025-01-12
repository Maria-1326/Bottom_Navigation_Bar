import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_hub/Core/Custom/container.dart';
import 'package:food_hub/Core/Utils/Theme/app_color.dart';
import 'package:food_hub/Core/Utils/app_images.dart';
import 'package:food_hub/View/Add%20Adress/add_new_adress.dart';
import 'package:food_hub/View/Home/Favorites/favorite.dart';
import 'package:food_hub/View/Home/Food%20Datils/food_datils.dart';
import 'package:food_hub/View/Home/My%20Order/my_order.dart';
import 'package:food_hub/View/Home/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    NewAdress(),
    FoodDetails(),
    Favorite(),
    MyOrderUpcoming(),
  ];

  void onTab(int index) {
    setState(() {
      selectedIndex = index;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screens[index],
      ),
    ).then((value) {
      setState(() {
        selectedIndex = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        color: AppColor.White,
        height: 8.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconBottomBar(
              image: AppImages.home,
              seected: selectedIndex == 0,
              onPressed: () => onTab(0),
            ),
            IconBottomBar(
              image: AppImages.Location,
              seected: selectedIndex == 1,
              onPressed: () => onTab(1),
            ),
            IconBottomBar(
              image: AppImages.Bag,
              seected: selectedIndex == 2,
              onPressed: () => onTab(2),
            ),
            IconBottomBar(
              image: AppImages.Faveriot,
              seected: selectedIndex == 3,
              onPressed: () => onTab(3),
            ),
            IconBottomBar(
              image: AppImages.Notifications,
              seected: selectedIndex == 4,
              onPressed: () => onTab(4),
            ),
          ],
        ));
  }
}

class IconBottomBar extends StatelessWidget {
  final bool? text;
  final String image;
  final bool seected;
  final Function() onPressed;

  const IconBottomBar(
      {super.key,
      required this.image,
      this.text,
      required this.seected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: SvgPicture.asset(
            image,
            // ignore: deprecated_member_use
            color: seected ? AppColor.PrimaryColor : AppColor.Gray50,
            height: 20,
            width: 20,
          ),
        ),
        text == true
            ? Text(
                text as String,
                style: TextStyle(
                    fontSize: 12.h,
                    height: 1,
                    color: seected ? Colors.black12 : Colors.blue),
              )
            : SizedBox(),
      ],
    );
  }
}
