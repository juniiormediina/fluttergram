import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class Input extends StatefulWidget {
  Input(
      {required this.controller,
      required this.label,
      this.placeholder = '',
      this.error,
      this.icon,
      this.enabled = true,
      this.autocorrect = false,
      this.autofocus = false,
      this.enableSuggestions = false,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      required this.onChange,
      this.node,
      this.sufix,
      this.multiline = false,
      this.inputFormatters,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final String? error;
  final String placeholder;
  final IconData? icon;
  final Widget? sufix;
  final bool enabled;
  final bool autocorrect;
  final bool autofocus;
  final bool enableSuggestions;
  final bool multiline;
  final void Function(String) onChange;
  final TextInputType keyboardType;
  final bool isPassword;
  final FocusNode? node;
  final List<TextInputFormatter>? inputFormatters;

  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  FocusNode? focusNode;

  @override
  void dispose() {
    if (widget.node == null) {
      focusNode?.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode = widget.node ?? FocusNode();
  }

  InputDecoration getDecorator() => InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 14,
          color: widget.error != null ? Colors.red[200] : textColor,
        ),
        hintText: widget.placeholder,
        prefixIcon: Icon(
          widget.icon,
          color: widget.error != null ? Colors.red[200] : textColor,
        ),
        suffix: widget.sufix,
        errorText: widget.error,
        errorMaxLines: 2,
      );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      // TODO: Input formaters agregar logica
      //inputFormatters: [],
      keyboardType: widget.keyboardType,
      focusNode: focusNode,
      controller: widget.controller,
      enabled: widget.enabled,
      autocorrect: widget.autocorrect,
      autofocus: widget.autofocus,
      obscureText: widget.isPassword,
      enableSuggestions: widget.enableSuggestions,
      decoration: getDecorator(),
      maxLines: widget.multiline ? 5 : 1,
      onChanged: widget.onChange,
    );
  }
}
