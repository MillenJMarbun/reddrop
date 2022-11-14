import 'package:flutter/material.dart';
import 'package:reddrop/presentation/shared_widgets/reddrop_appbar.dart';
import 'package:reddrop/presentation/shared_widgets/reddrop_dialog.dart';
import 'package:reddrop/presentation/shared_widgets/textfield_widget.dart';
import 'package:reddrop/presentation/styles.dart';
import 'package:reddrop/presentation/shared_widgets/getstarted_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: Styles().boxDecoration(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReddropAppBar(),
            SizedBox(height: 40),
            Text("FORGOT PASSWORD",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'GilroyLight',
                  color: Colors.white,
                )),
            SizedBox(height: 20),
            Text("ENTER YOUR EMAIL ACCOUNT TO RESET YOUR PASSWORD",
                style: Styles().gilroy()),
            SizedBox(height: 60),
            Text("YOUR EMAIL", style: Styles().gilroy()),
            SizedBox(height: 20),
            reddropTxtField(hintText: "Please enter your email address"),
            SizedBox(height: 20),
            getStartedButton(context, function: () {
              RedDropDialog(context);
            }),
          ],
        ),
      ),
    );
  }
}
