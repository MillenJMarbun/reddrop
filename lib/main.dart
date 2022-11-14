import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reddrop/injection_container.dart';
import 'package:reddrop/presentation/bloc/chatbot/chatbot_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddrop/presentation/bloc/yearpicker/yearpicker_bloc.dart';
import 'package:reddrop/presentation/screen/login_screen/login_screen.dart';
import 'package:reddrop/injection_container.dart' as di;
import 'package:reddrop/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black.withOpacity(0.002),
  ));
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final chatbotBloc = sl<ChatbotBloc>();
  final yearpickerBloc = sl<YearpickerBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => chatbotBloc),
        BlocProvider(create: (_) => yearpickerBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textSelectionTheme:
              TextSelectionThemeData(selectionHandleColor: Colors.white),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
