import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/counter_repository_impl.dart';
import 'domain/usecases/increment.dart';
import 'domain/usecases/decrement.dart';
import 'presentation/bloc/counter_bloc.dart';
import 'presentation/pages/counter_page.dart';
void main() {
  final counterRepository = CounterRepositoryImpl();
  runApp(MyApp(
    counterBloc: CounterBloc(
      incrementCounter: IncrementCounter(counterRepository),
      decrementCounter: DecrementCounter(counterRepository),
    ),
  ));
}
class MyApp extends StatelessWidget {
  final CounterBloc counterBloc;
  const MyApp({super.key, required this.counterBloc});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => counterBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterPage(),
      ),
    );
  }
}