import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/main.dart'; // Adjust based on your project name
import 'package:app/presentation/bloc/counter_bloc.dart';
import 'package:app/data/repositories/counter_repository_impl.dart';
import 'package:app/domain/usecases/increment.dart';
import 'package:app/domain/usecases/decrement.dart';
void main() {
testWidgets('Counter increments smoke test', (WidgetTester tester) async {
// Initialize dependencies
final counterRepository = CounterRepositoryImpl();
final counterBloc = CounterBloc(
incrementCounter: IncrementCounter(counterRepository),
decrementCounter: DecrementCounter(counterRepository),
);
// Build our app and trigger a frame.
await tester.pumpWidget(
BlocProvider(
create: (_) => counterBloc,
child: MyApp(counterBloc: counterBloc), //  Pass the required parameter
),
);
// Verify that our counter starts at 0.
expect(find.text('0'), findsOneWidget);
expect(find.text('1'), findsNothing);
// Tap the '+' icon and trigger a frame.
await tester.tap(find.byIcon(Icons.add));
await tester.pump();
// Verify that counter has incremented.
expect(find.text('1'), findsOneWidget);
});
}