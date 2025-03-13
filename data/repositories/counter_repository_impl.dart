import '../../domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {

  int _counter = 0;

  @override

  int getCounter() => _counter;

  @override

  void setCounter(int value) {

    _counter = value;

  }

}