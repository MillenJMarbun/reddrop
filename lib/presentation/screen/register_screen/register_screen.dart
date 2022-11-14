import 'package:flutter/material.dart';
import 'package:reddrop/presentation/screen/login_screen/login_screen.dart';
import 'package:reddrop/presentation/shared_widgets/getstarted_button.dart';
import 'package:reddrop/presentation/shared_widgets/password_textfield.dart';
import 'package:reddrop/presentation/shared_widgets/reddrop_appbar.dart';
import 'package:reddrop/presentation/shared_widgets/textfield_widget.dart';
import 'package:reddrop/presentation/styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: DefaultTextStyle(
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'GilroyLight',
          color: Colors.white.withOpacity(0.8),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: Styles().boxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      ReddropAppBar(),
                      SizedBox(height: 40),
                      Text(
                        "REGISTER",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'GilroyLight',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("CREATE YOUR ACCOUNT", style: Styles().gilroy()),
                      SizedBox(height: 40),
                      Text(
                        "FIRST NAME",
                      ),
                      SizedBox(height: 20),
                      reddropTxtField(hintText: "Please enter your first name"),
                      SizedBox(height: 20),
                      Text("LAST NAME"),
                      SizedBox(height: 20),
                      reddropTxtField(hintText: "Please enter your last name"),
                      SizedBox(height: 20),
                      Text("YOUR EMAIL"),
                      SizedBox(height: 20),
                      reddropTxtField(hintText: "Please enter your email"),
                      SizedBox(height: 20),
                      Text("YOUR PASSWORD"),
                      SizedBox(height: 20),
                      ReddropPasswordTxtField(
                        context,
                        action: TextInputAction.done,
                        type: TextInputType.text,
                        label: 'Please enter your password',
                        hide: isVisible ? false : true,
                        suffixIcon: hideUnhidePassword,
                      ),
                      SizedBox(height: 50),
                      getStartedButton(context, function: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
