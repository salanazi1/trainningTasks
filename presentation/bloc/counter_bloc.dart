import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/increment.dart';
import '../../domain/usecases/decrement.dart';
import 'counter_event.dart';
import 'counter_state.dart';
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;
  CounterBloc({required this.incrementCounter, required this.decrementCounter})
      : super(const CounterState(0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(incrementCounter()));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterState(decrementCounter()));
    });
  }
}