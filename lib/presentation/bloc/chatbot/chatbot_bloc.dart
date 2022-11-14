import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chatbot_event.dart';
part 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  ChatbotBloc() : super(ChatbotInitial()) {
    on<ChatbotEvent>((event, emit) {
      if (event is SelectTopic) {
        emit(SelectedTopic(topic: event.topic));
      }
      if (event is Chatbotinit) {
        emit(ChatbotInitial());
      }
    });
  }
}
