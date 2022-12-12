import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>(
  (ref) {
    return Stream.periodic(
      const Duration(seconds: 2),
      (computationCount) => computationCount,
    );
  },
);

class SeventhExampleStream extends ConsumerWidget {
  static const String routeName = '/seventh_example';
  const SeventhExampleStream({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seventh Example Stream'),
      ),
      body: streamData.when(
        data: (data) => Text(
          data.toString(),
          style: const TextStyle(fontSize: 25),
        ),
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
