import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reddrop/presentation/screen/chatbot_screen/chat_screen.dart';
import 'package:reddrop/presentation/shared_widgets/reddrop_appbar.dart';
import 'package:reddrop/presentation/styles.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: const Color(0xff1e1E1e),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          children: [
            ReddropAppBar(title: false),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.1,
                  child: Image.asset(
                    "assets/bot_figure.png",
                  ),
                ),
                Positioned(
                    right: 1,
                    top: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          height: 70,
                          width: 145,
                          color: Color(0xff636363).withOpacity(0.3),
                          child: Center(
                              child: Text("Hey Tam 👋",
                                  style: Styles().plusJakarta())),
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 20),
            Text("Welcome",
                style: Styles()
                    .plusJakarta(fontSize: 23.0, color: Color(0xff82899C))),
            SizedBox(height: 20),
            Text(
              "How may I\nhelp you today",
              style: Styles().plusJakarta(fontSize: 35.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.mic_none_outlined,
                            color: Colors.white, size: 35),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChatScreen()));
                      },
                      child: Container(
                          height: 100,
                          child: Image.asset('assets/voice_view.png')),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 80,
                        child: Image.asset(
                          "assets/keyboard.png",
                          scale: 1.2,
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
