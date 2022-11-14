import 'package:flutter/material.dart';
import 'package:reddrop/presentation/screen/chatbot_screen/chatbot_screen.dart';
import 'package:reddrop/presentation/screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:reddrop/presentation/screen/register_screen/register_screen.dart';
import 'package:reddrop/presentation/shared_widgets/getstarted_button.dart';
import 'package:reddrop/presentation/shared_widgets/password_textfield.dart';
import 'package:reddrop/presentation/shared_widgets/textfield_widget.dart';
import 'package:reddrop/presentation/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: Styles().boxDecoration(),
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60),
              Text(
                ".REDDROP",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'postnobillscolombobold',
                    color: Colors.white),
              ),
              SizedBox(height: 25),
              Text("WELCOME BACK,\nREDDROP MEMBER",
                  style: Styles().gilroy(fontSize: 25.0)),
              SizedBox(height: 25),
              Text("SIGN IN TO YOUR ACCOUNT", style: Styles().gilroy()),
              SizedBox(height: 40),
              Text("YOUR EMAIL", style: Styles().gilroy()),
              SizedBox(height: 10),
              reddropTxtField(hintText: "Please enter your email address"),
              SizedBox(height: 20),
              Text("PASSWORD", style: Styles().gilroy()),
              SizedBox(height: 10),
              ReddropPasswordTxtField(
                context,
                action: TextInputAction.done,
                type: TextInputType.text,
                label: 'Please enter your password',
                hide: isVisible ? false : true,
                suffixIcon: hideUnhidePassword,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text("Forgot Password",
                        style: Styles().gilroy(fontSize: 12.0)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                    }),
              ),
              SizedBox(height: 45),
              getStartedButton(context, function: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChatBotScreen()));
              }),
              SizedBox(height: 40),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/gmail.png"))),
              SizedBox(height: 50),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'By clicking Get Started you agree to\n',
                              style: Styles().gilroy(),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Terms & Conditions ',
                                  style: Styles().gilroy(defcol: false),
                                ),
                                TextSpan(
                                  text: 'and ',
                                  style: Styles().gilroy(),
                                ),
                                TextSpan(
                                  text: 'Privacy & Cookie Policy ',
                                  style: Styles().gilroy(defcol: false),
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",
                                style: Styles().gilroy()),
                            TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.all(10),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text("Sign Up",
                                    style: Styles().gilroy(defcol: false)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
