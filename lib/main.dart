import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_riverpod/fourth_exampled.dart';
import 'package:state_riverpod/page/6th%20example%20api/sixth_exaple_api.dart';
import 'package:state_riverpod/page/fifth_example/fifth_example.dart';
import 'package:state_riverpod/page/first_example.dart';

import 'package:state_riverpod/page/second_example.dart';
import 'package:state_riverpod/page/third_exampled.dart';
import 'package:state_riverpod/seveth_example_stream.dart';

final nameProvider = Provider<String>((ref) {
  return 'Hello Aman';
});
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SeventhExampleStream.routeName,
      routes: {
        FirstExample.routeName: (context) => FirstExample(),
        SecondExample.routeName: (context) => SecondExample(),
        ThirdExample.routeName: (context) => ThirdExample(),
        FourthExample.routeName: (context) => FourthExample(),
        FifthExample.routeName: (context) => FifthExample(),
        SixthExampleApi.routeName: (context) => SixthExampleApi(),
        SeventhExampleStream.routeName: (context) => SeventhExampleStream()
      },
    );
  }
}
