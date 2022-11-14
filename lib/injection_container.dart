import 'package:get_it/get_it.dart';
import 'package:reddrop/presentation/bloc/chatbot/chatbot_bloc.dart';
import 'package:reddrop/presentation/bloc/yearpicker/yearpicker_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => ChatbotBloc());
  sl.registerFactory(() => YearpickerBloc());
}
