part of 'yearpicker_bloc.dart';

abstract class YearpickerState extends Equatable {
  const YearpickerState();
}

class YearpickerInitial extends YearpickerState {
  @override
  List<Object> get props => [];
}

class SelectedYear extends YearpickerState {
  String year;
  SelectedYear({required this.year});

  @override
  List<Object> get props => [year];
}
