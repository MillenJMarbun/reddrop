import 'package:flutter/material.dart';
import 'package:reddrop/presentation/screen/forgot_password_screen/newpassword_screen.dart';
import 'package:reddrop/presentation/screen/login_screen/login_screen.dart';
import 'package:reddrop/presentation/styles.dart';

void BUILD(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.7),
      transitionBuilder: (context, a1, a2, widget) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: a1.value * 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(80),
                      bottomLeft: Radius.circular(20)),
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
                  )),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset('assets/checkmark.png'),
                  SizedBox(height: 10),
                  Text("HI"),
                  Text("OK"),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200), // DURATION FOR ANIMATION
      barrierDismissible: true,
      barrierLabel: 'LABEL',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Text('PAGE BUILDER');
      });
}

void RedDropDialog(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.7),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: a1.value * 320,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff412342), width: 2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(80),
                            bottomLeft: Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.5, 1],
                          colors: [
                            Color(0xff3a3737),
                            Color(0xff221f1f),
                          ],
                        )),
                    child: DefaultTextStyle(
                      style: TextStyle(
                          fontFamily: 'GilroyLight', color: Colors.white),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Image.asset('assets/checkmark.png'),
                          SizedBox(height: 15),
                          Text("CHECK YOUR EMAIL",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                          Text(
                              textAlign: TextAlign.center,
                              "WE HAVE SENT PASSWORD\nRECOVERY INSTRUCTION TO\nYOUR EMAIL"),
                          SizedBox(height: 20),
                          Container(
                              width: 100 * a1.value,
                              height: 50 * a1.value,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          NewPasswordScreen()));
                                },
                                child: Text(
                                  'OK',
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff161517),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}

void NewPasswordDialog(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.7),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: a1.value * 320,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff412342), width: 2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(80),
                            bottomLeft: Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.5, 1],
                          colors: [
                            Color(0xff3a3737),
                            Color(0xff221f1f),
                          ],
                        )),
                    child: DefaultTextStyle(
                      style: TextStyle(
                          fontFamily: 'GilroyLight', color: Colors.white),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Image.asset('assets/checkmark.png'),
                          SizedBox(height: 90),
                          Container(
                              width: 100 * a1.value,
                              height: 50 * a1.value,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  'LOGIN',
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff161517),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}
