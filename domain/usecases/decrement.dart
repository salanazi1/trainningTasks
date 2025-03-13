import '../repositories/counter_repository.dart';

class DecrementCounter {

  final CounterRepository repository;

  DecrementCounter(this.repository);

  int call() {

    int newValue = repository.getCounter() - 1;

    repository.setCounter(newValue);

    return newValue;

  }

}