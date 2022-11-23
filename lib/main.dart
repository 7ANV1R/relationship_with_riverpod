import 'package:all_provider/screens/future_provider.dart';
import 'package:all_provider/screens/provider.dart';
import 'package:all_provider/screens/state_notifier_provider.dart';
import 'package:all_provider/screens/stream_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StateRivNotifier(),
    );
  }
}
