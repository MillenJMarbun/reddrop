import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  BoxDecoration boxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5, 1],
      colors: [
        Color(0xff221f1f),
        //Color(0xff1e1e1e),
        //Color(0xff221f1f),
        Color(0xff000000),
      ],
    ));
  }

  TextStyle gilroy({fontSize = 14.0, defcol = true}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'GilroyLight',
      color: defcol ? Colors.white.withOpacity(0.5) : Color(0xff2f2850),
    );
  }

  TextStyle plusJakarta({fontSize = 18.0, Color color = Colors.white}) {
    return GoogleFonts.plusJakartaSans(
      textStyle: TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}
