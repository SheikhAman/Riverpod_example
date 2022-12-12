import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_riverpod/main.dart';

class SecondExample extends StatelessWidget {
  static const String routeName = '/second_example';
  const SecondExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Example of Riverpod Provider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final name = ref.watch(nameProvider);
            return Text(name);
          },
        ),
      ),
    );
  }
}
