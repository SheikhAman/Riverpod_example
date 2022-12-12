import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_riverpod/main.dart';

class FirstExample extends ConsumerWidget {
  static const String routeName = '/first_example';
  const FirstExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Example Of Riverpod Provider'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
