import 'package:flutter/material.dart';
import 'package:reddrop/presentation/shared_widgets/getstarted_button.dart';
import 'package:reddrop/presentation/shared_widgets/password_textfield.dart';
import 'package:reddrop/presentation/shared_widgets/reddrop_appbar.dart';
import 'package:reddrop/presentation/shared_widgets/reddrop_dialog.dart';
import 'package:reddrop/presentation/styles.dart';
import 'package:reddrop/presentation/shared_widgets/textfield_widget.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool isVisible = false;

  Widget hideUnhidePassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        child: InkWell(
          onTap: () => setState(
            () => isVisible = !isVisible,
          ),
          child: Image.asset(
            isVisible ? "assets/eye_inactive.png" : "assets/eye_active.png",
            scale: isVisible ? 1.1 : 1,
          ),
        ),
      ),
    );
  }

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
              Text("NEW PASSWORD",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'GilroyLight',
                    color: Colors.white,
                  )),
              SizedBox(height: 20),
              Text(
                  "ENTER YOUR NEW PASSWORD AND\nDON'T FORGET IT AGAIN BECAUSE IT\nTAKES TIME TO RETURN IT",
                  style: Styles().gilroy()),
              SizedBox(height: 40),
              Text("YOUR EMAIL", style: Styles().gilroy()),
              SizedBox(height: 10),
              reddropTxtField(hintText: "Please enter your email address"),
              SizedBox(height: 20),
              Text("Password", style: Styles().gilroy()),
              SizedBox(height: 10),
              ReddropPasswordTxtField(
                context,
                action: TextInputAction.done,
                type: TextInputType.text,
                label: 'Please enter your password',
                hide: isVisible ? false : true,
                suffixIcon: hideUnhidePassword,
              ),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: getStartedButton(context, function: () {
                    NewPasswordDialog(context);
                  }, isGradient: true))
            ]),
      ),
    );
  }
}
