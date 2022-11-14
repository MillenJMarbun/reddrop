import 'package:flutter/material.dart';
import 'package:reddrop/presentation/styles.dart';

void noAction() {}

Container getStartedButton(BuildContext context,
    {Function function = noAction, bool isGradient = false}) {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff62b1e2), Color(0xffe04fea).withOpacity(0.64)],
  ).createShader(Rect.fromLTWH(130.0, 0.0, 200.0, 70.0));

  return Container(
    height: 60,
    width: MediaQuery.of(context).size.height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff242226),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        function();
      },
      child: Text("GET STARTED",
          style: isGradient
              ? TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: 15,
                  fontFamily: 'GilroyLight',
                )
              : TextStyle(
                  fontSize: 15,
                  fontFamily: 'GilroyLight',
                )),
    ),
  );
}
