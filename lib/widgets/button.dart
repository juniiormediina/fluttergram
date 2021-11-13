import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class Button extends StatelessWidget {
  Button(
      {required this.label,
      required this.onPress,
      this.disable = false,
      Key? key})
      : super(key: key);

  final String label;
  final void Function() onPress;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: getProportionsScreenHeigth(60),
          width: constraints.maxWidth,
          child: TextButton(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionsScreenHeigth(18),
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: !disable ? primaryColor : disablePrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: !disable ? onPress : null,
          ),
        );
      },
    );
  }
}
