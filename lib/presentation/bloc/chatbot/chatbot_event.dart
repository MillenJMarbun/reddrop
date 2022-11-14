part of 'chatbot_bloc.dart';

abstract class ChatbotEvent extends Equatable {
  const ChatbotEvent();
}

class Chatbotinit extends ChatbotEvent {
  @override
  List<Object?> get props => [];
}

class SelectTopic extends ChatbotEvent {
  final String topic;
  SelectTopic({required this.topic});

  @override
  List<Object?> get props => [topic];
}
