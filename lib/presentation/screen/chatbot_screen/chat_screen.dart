import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:reddrop/data/utils/static_data_provider.dart';
import 'package:reddrop/presentation/bloc/chatbot/chatbot_bloc.dart';
import 'package:reddrop/presentation/bloc/yearpicker/yearpicker_bloc.dart';
import 'package:reddrop/presentation/screen/chatbot_screen/calendar_picker_screen.dart';
import 'package:reddrop/presentation/shared_widgets/chat_bubble.dart';
import 'package:reddrop/presentation/shared_widgets/reddrop_appbar.dart';
import 'package:reddrop/presentation/styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  StaticData stdata = new StaticData();
  final ScrollController controller = ScrollController();
  TextEditingController txtcontroller = TextEditingController();

  void scrollDown() {
    //controller.jumpTo(controller.position.maxScrollExtent);
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.hasClients) {
        scrollDown();
      }
    });
  }

  List<String> listoftext = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //extendBody: false,
      backgroundColor: const Color(0xff1e1E1e),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ReddropAppBar(suffix: true)),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      FadeIn(
                        child: ChatBubble(
                          context,
                          id: 1,
                          widget: Text(
                            "👋 Welcome!\nAre you a pregnant?",
                            style: Styles().plusJakarta(fontSize: 14.0),
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        curve: Curves.linear,
                      ),
                      SizedBox(height: 20),
                      FadeIn(
                        duration: Duration(seconds: 2),
                        curve: Curves.linear,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                "Select the topic or write your\n question below.",
                                style: Styles().plusJakarta(
                                    fontSize: 14.0, color: Color(0xff545C72)),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 150,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: stdata.topics.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<ChatbotBloc>(context)
                                            .add(SelectTopic(
                                                topic: stdata
                                                    .topics[index].title));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                                color:
                                                    stdata.topics[index].color,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))),
                                            padding: EdgeInsets.all(20),
                                            child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        stdata.topics[index]
                                                            .title,
                                                        style: Styles()
                                                            .plusJakarta(
                                                                color: Color(
                                                                    0xff12131A),
                                                                fontSize: 16.0),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(Icons
                                                            .chevron_right))
                                                  ],
                                                ))),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      BlocBuilder<ChatbotBloc, ChatbotState>(
                          builder: (context, state) {
                        if (state is SelectedTopic) {
                          return Column(
                            children: [
                              FadeIn(
                                child: Column(children: [
                                  ChatBubble(
                                    context,
                                    id: 2,
                                    widget: Text(
                                      state.topic,
                                      style:
                                          Styles().plusJakarta(fontSize: 14.0),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  ChatBubble(
                                    context,
                                    id: 1,
                                    widget: Text(
                                      "What year were you born?",
                                      style:
                                          Styles().plusJakarta(fontSize: 14.0),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CalendarPicker()));
                                        },
                                        child: ChatBubble(context,
                                            id: 2,
                                            widget: Image.asset(
                                              "assets/calendar.png",
                                            )),
                                      ),
                                    ),
                                  ),
                                ]),
                                duration: Duration(seconds: 2),
                                curve: Curves.linear,
                              ),
                            ],
                          );
                        }
                        if (state is ChatbotInitial) {
                          return Container();
                        }
                        return Container();
                      }),
                      SizedBox(height: 20),
                      BlocBuilder<YearpickerBloc, YearpickerState>(
                          builder: (context, state) {
                        if (state is SelectedYear) {
                          return Column(
                            children: [
                              ChatBubble(
                                context,
                                id: 2,
                                widget: Text(
                                  state.year,
                                  style: Styles().plusJakarta(fontSize: 14.0),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          );
                        }
                        if (state is YearpickerInitial) {
                          return Container();
                        }
                        return Container();
                      }),
                      SizedBox(height: 20),
                      ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10);
                          },
                          shrinkWrap: true,
                          itemCount: listoftext.length,
                          itemBuilder: (context, index) {
                            return ChatBubble(
                              context,
                              id: 2,
                              widget: Text(
                                listoftext[index],
                                style: Styles().plusJakarta(fontSize: 14.0),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
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
                              controller: txtcontroller,
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
                              child: GestureDetector(
                                onTap: () {
                                  scrollDown();
                                  if (txtcontroller.text.length > 0) {
                                    listoftext.add(txtcontroller.text);
                                    txtcontroller.clear();
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Color(0xff574DDD),
                                  child: Icon(Icons.chevron_right),
                                ),
                              )),
                        ],
                      ))
                    ],
                  )),
            ]),
      ),
    );
  }
}
