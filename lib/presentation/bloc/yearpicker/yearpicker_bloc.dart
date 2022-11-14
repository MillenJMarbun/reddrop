import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'yearpicker_event.dart';
part 'yearpicker_state.dart';

class YearpickerBloc extends Bloc<YearpickerEvent, YearpickerState> {
  YearpickerBloc() : super(YearpickerInitial()) {
    on<YearpickerEvent>((event, emit) {
      if (event is SelectYear) {
        emit(SelectedYear(year: event.year));
      }
      if (event is Yearpickerinit) {
        emit(YearpickerInitial());
      }
    });
  }
}
