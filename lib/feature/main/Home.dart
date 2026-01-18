import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/feature/cart/presentation/page/cart.dart';
import 'package:bookia1/feature/home/presentation/pages/shop_screen.dart';
import 'package:bookia1/feature/profile/presentation/page/profile_screen.dart';
import 'package:bookia1/feature/wishlist/presentation/page/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screen = [
    ShopScreen(),
    Wishlist(),
    Cart(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: appcolors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          unselectedItemColor: appcolors.gray,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Home.svg"),
                label: "Home",
                activeIcon: SvgPicture.asset("assets/icons/Home.svg",
                    colorFilter:
                        ColorFilter.mode(appcolors.prime, BlendMode.srcIn))),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
                label: "Favourite",
                activeIcon: SvgPicture.asset("assets/icons/Bookmark.svg",
                    colorFilter:
                        ColorFilter.mode(appcolors.prime, BlendMode.srcIn))),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Category.svg"),
                label: "Category",
                activeIcon: SvgPicture.asset("assets/icons/Category.svg",
                    colorFilter:
                        ColorFilter.mode(appcolors.prime, BlendMode.srcIn))),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Profile.svg"),
                label: "Profile",
                activeIcon: SvgPicture.asset("assets/icons/Profile.svg",
                    colorFilter:
                        ColorFilter.mode(appcolors.prime, BlendMode.srcIn))),
          ]),
    );
  }
}
