import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:reddrop/presentation/bloc/yearpicker/yearpicker_bloc.dart';
import 'package:reddrop/presentation/screen/chatbot_screen/chat_screen.dart';
import 'package:reddrop/presentation/shared_widgets/reddrop_appbar.dart';
import 'package:reddrop/presentation/styles.dart';

class CalendarPicker extends StatefulWidget {
  CalendarPicker({Key? key}) : super(key: key);

  @override
  State<CalendarPicker> createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<CalendarPicker> {
  int _currentValue = 2000;
  DateTime nowDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff1e1E1e),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReddropAppBar(suffix: true),
            SizedBox(height: 50),
            Text(
              "What year were you born?",
              style: Styles().plusJakarta(fontSize: 22.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Text(
              "Cycle predictions will be more\naccurate if knows your age",
              style: Styles().plusJakarta(
                  fontSize: 16.0, color: Colors.white.withOpacity(0.7)),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Container(
                //color: Colors.pink,
                padding: EdgeInsets.all(100),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<YearpickerBloc>(context)
                        .add(SelectYear(year: _currentValue.toString()));
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  child: NumberPicker(
                    haptics: true,
                    itemHeight: 100,
                    selectedTextStyle: Styles()
                        .plusJakarta(fontSize: 30.0, color: Colors.white),
                    textStyle: Styles().plusJakarta(
                        fontSize: 16.0, color: Colors.white.withOpacity(0.5)),
                    value: _currentValue,
                    minValue: 1900,
                    maxValue: nowDate.year,
                    onChanged: (value) => setState(() => _currentValue = value),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 17,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: const Color(0xff1e1e1e),
                        child: Icon(Icons.chevron_left,
                            color: Colors.white.withOpacity(0.9)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.3, 1],
                                colors: [
                                  Color(0xff434343),
                                  Color(0xff0B0A0C),
                                ],
                              )),
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                )),
                          ),
                        ),
                        Positioned(
                            right: 1,
                            top: 3,
                            child: CircleAvatar(
                              radius: 23,
                              backgroundColor: Color(0xff574DDD),
                              child: Icon(Icons.chevron_right),
                            )),
                      ],
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
