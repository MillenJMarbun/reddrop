import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddrop/presentation/styles.dart';

void _noAction() {}
_defaultWidget() {
  return null;
}

TextFormField ReddropPasswordTxtField(
  BuildContext context, {
  Function change = _noAction,
  Function validator = _noAction,
  TextInputAction action = TextInputAction.done,
  TextInputType type = TextInputType.name,
  bool hide = false,
  String label = '',
  String hint = '',
  double textSize = 0,
  FloatingLabelAlignment labelAlign = FloatingLabelAlignment.start,
  TextStyle labelStyle = const TextStyle(),
  Function suffixIcon = _defaultWidget,
  Function prefixIcon = _defaultWidget,
  double radius = 15,
  double horizontal = 20,
  double vertical = 20,
  List<TextInputFormatter> formatter = const <TextInputFormatter>[],
}) {
  return TextFormField(
    onChanged: (String value) => change(value),
    validator: (String? value) => validator(value),
    textInputAction: action,
    keyboardType: type,
    obscureText: hide,
    cursorColor: Colors.white,
    style: Styles().gilroy(),
    inputFormatters: formatter,
    decoration: InputDecoration(
        prefixIcon: prefixIcon(),
        suffixIcon: suffixIcon(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        hintStyle: TextStyle(
            fontSize: 18,
            fontFamily: 'GilroyLight',
            color: Colors.white.withOpacity(0.1)),
        hintText: label,
        fillColor: Colors.white70),
  );
}
