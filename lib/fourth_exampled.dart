import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// state provider is used to store mutable objects(string,enum,boolean,numbers)
final counterProvider = StateProvider<int>(
  (ref) {
    int counter = 0;
    return counter;
  },
);

class FourthExample extends ConsumerWidget {
  static const String routeName = '/fourth_example';
  const FourthExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    // build method e watch use  korbo r onno sob jaigai read
    final counter = ref.watch(counterProvider);

    // to listen provider value change we use listener
    ref.listen(
      counterProvider,
      (previous, next) {
        if (next == 5) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('The value is $next')));
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('FourthExample State Riverpod'),
        actions: [
          IconButton(
              onPressed: () {
                // state ta abar purber obosthai ana
                // ref.invalidate(counterProvider);
                ref.refresh(counterProvider);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
