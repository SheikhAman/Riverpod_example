import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_riverpod/page/fifth_example/fifth_example_controller.dart';

final counterProvider = StateNotifierProvider<CounterDemo, int>(
  (ref) => CounterDemo(),
);

class FifthExample extends ConsumerWidget {
  static const String routeName = '/fifth_example';
  const FifthExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierProvider with StateNotifier'),
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
