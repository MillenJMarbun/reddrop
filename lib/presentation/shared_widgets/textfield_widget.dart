import 'package:flutter/material.dart';
import 'package:reddrop/presentation/styles.dart';

reddropTxtField({String hintText = ""}) {
  return Container(
    height: 60,
    child: TextField(
      cursorColor: Colors.white,
      autocorrect: false,
      enableSuggestions: false,
      style: Styles().gilroy(),
      decoration: InputDecoration(
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
          hintText: hintText,
          fillColor: Colors.white70),
    ),
  );
}
