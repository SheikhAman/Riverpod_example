import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_riverpod/main.dart';

class ThirdExample extends ConsumerStatefulWidget {
  static const String routeName = '/third_example';
  ThirdExample({super.key});

  @override
  _ThirdExampleState createState() => _ThirdExampleState();
}

class _ThirdExampleState extends ConsumerState<ThirdExample> {
  String? name2;
  @override
  void initState() {
    name2 = ref.read(nameProvider);
    print(name2);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third example Provider Riverpod'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(name), Text(name2!)],
      ),
    );
  }
}
