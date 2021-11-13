import 'package:flutter/material.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/screens/auth/auth_view.dart';
import 'package:fluttergram/ui_shared/constanst.dart';

import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/image.dart';
import 'package:fluttergram/widgets/button.dart';

List<Map<String, String>> sliderData = <Map<String, String>>[
  {
    "text": "Welcome to fluttergram",
    "image": "assets/images/friends.svg",
  },
  {
    "text": "We help people to connect with friends\n arround the world",
    "image": "assets/images/love.svg"
  },
  {
    "text": "Meet interesting people\n and interact with them",
    "image": "assets/images/vacations.svg"
  }
];

class WalkthroughView extends StatefulWidget {
  static String route = 'walkthrough';

  _WalkthroughViewState createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends State<WalkthroughView> {
  int pageIndex = 0;

  final NavigatorService navigator = locator<NavigatorService>();

  void goToLogin() {
    navigator.push(route: AuthView.route);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                itemCount: sliderData.length,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    SizedBox(
                      height: getProportionsScreenHeigth(64),
                    ),
                    Text(
                      'FLUTTERGRAM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getProportionsScreenHeigth(24),
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: getProportionsScreenHeigth(16),
                    ),
                    Text(
                      sliderData[index]['text'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getProportionsScreenHeigth(18),
                      ),
                    ),
                    SizedBox(
                      height: getProportionsScreenHeigth(16),
                    ),
                    ImageFactory.fromAssets(
                      asset: sliderData[index]['image'] as String,
                      width: getProportionsScreenWidth(320),
                      height: getProportionsScreenHeigth(240),
                    ),
                  ],
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionsScreenWidth(24),
                ),
                child: Column(
                  children: <Widget>[
                    ///Indicadores
                    SizedBox(
                      height: getProportionsScreenHeigth(16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        sliderData.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    Spacer(),
                    Button(
                      label: 'Next',
                      onPress: goToLogin,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) => AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: index == pageIndex ? 20 : 6,
        decoration: BoxDecoration(
          color: index == pageIndex ? primaryColor : secondaryColor,
          borderRadius: BorderRadius.circular(3),
        ),
      );
}
