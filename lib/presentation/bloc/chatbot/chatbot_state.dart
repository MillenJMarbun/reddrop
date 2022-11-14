part of 'chatbot_bloc.dart';

abstract class ChatbotState extends Equatable {
  const ChatbotState();
}

class ChatbotInitial extends ChatbotState {
  @override
  List<Object> get props => [];
}

class SelectedTopic extends ChatbotState {
  String topic;
  SelectedTopic({required this.topic});

  @override
  List<Object> get props => [topic];
}
