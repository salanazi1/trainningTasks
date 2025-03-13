import '../repositories/counter_repository.dart';
class IncrementCounter {
  final CounterRepository repository;
  IncrementCounter(this.repository);
  int call() {
    int newValue = repository.getCounter() + 1;
    repository.setCounter(newValue);
    return newValue;
  }
}