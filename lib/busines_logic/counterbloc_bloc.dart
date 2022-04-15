import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counterbloc_event.dart';
part 'counterbloc_state.dart';

class CounterblocBloc extends Bloc<CounterblocEvent, CounterblocInitial> {
  CounterblocBloc()
      : super(CounterblocInitial(counterValue: 0, wasIncremented: null)) {
    on<IncrementCounter>(
      (event, emit) => emit(
        CounterblocInitial(
            counterValue: state.counterValue + 1, wasIncremented: true),
      ),
    );
    ///////////////////////////////////////////////////////////////////////
    on<DecrementCounter>(
      (event, emit) => emit(
        CounterblocInitial(
            counterValue: state.counterValue - 1, wasIncremented: false),
      ),
    );
  }
}
