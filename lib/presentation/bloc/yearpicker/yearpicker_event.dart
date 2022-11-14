part of 'yearpicker_bloc.dart';

abstract class YearpickerEvent extends Equatable {
  const YearpickerEvent();
}

class Yearpickerinit extends YearpickerEvent {
  @override
  List<Object?> get props => [];
}

class SelectYear extends YearpickerEvent {
  final String year;
  SelectYear({required this.year});

  @override
  List<Object?> get props => [year];
}
