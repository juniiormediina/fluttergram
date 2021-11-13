import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/image.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class SocialButton extends StatelessWidget {
  SocialButton({
    required this.icon,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  final String icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: getProportionsScreenHeigth(48),
        width: getProportionsScreenWidth(48),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: lightGrey,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ImageFactory.fromAssets(
              asset: icon,
              width: getProportionsScreenWidth(24),
              height: getProportionsScreenHeigth(24),
            ),
          ),
        ),
      ),
    );
  }
}
