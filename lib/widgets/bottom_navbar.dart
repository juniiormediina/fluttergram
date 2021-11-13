import 'package:flutter/material.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/screens/home/home_view.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/image.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

enum MenuPage { home, favourites, messages, profile }

class BottomNavbar extends StatelessWidget {
  BottomNavbar({required this.currentPage, Key? key}) : super(key: key);
  final MenuPage currentPage;
  final NavigatorService navigator = locator<NavigatorService>();

  void navigateTo(String route) {
    navigator.push(route: route, key: navigator.homeNavigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, -14),
              blurRadius: 20,
              color: secondaryColor.withOpacity(0.15),
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  navigateTo(TimelineView.route);
                },
                icon: ImageFactory.svg(
                  'assets/icons/home.svg',
                  height: getProportionsScreenHeigth(32),
                  width: getProportionsScreenWidth(32),
                  color: currentPage == MenuPage.home
                      ? primaryColor
                      : disablePrimaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  //navigateTo(TimelineView.route);
                },
                icon: ImageFactory.fromAssets(
                  asset: 'assets/icons/heart.svg',
                  height: getProportionsScreenHeigth(32),
                  width: getProportionsScreenWidth(32),
                ),
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: getProportionsScreenHeigth(48),
                  width: getProportionsScreenWidth(48),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  //navigateTo(ProfileView.route);
                },
                icon: ImageFactory.fromAssets(
                  asset: 'assets/icons/chat.svg',
                  height: getProportionsScreenHeigth(32),
                  width: getProportionsScreenWidth(32),
                ),
              ),
              IconButton(
                onPressed: () {
                  navigateTo(ProfileView.route);
                },
                icon: ImageFactory.svg(
                  'assets/icons/user.svg',
                  height: getProportionsScreenHeigth(32),
                  width: getProportionsScreenWidth(32),
                  color: currentPage == MenuPage.profile
                      ? primaryColor
                      : disablePrimaryColor,
                ),
              ),
            ],
          ),
        ));
  }
}
