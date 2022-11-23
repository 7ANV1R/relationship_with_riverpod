import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerProvider = Provider(
  (ref) => 42,
);

class ProviderRiv extends StatelessWidget {
  const ProviderRiv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          return Text(
            ref.watch(providerProvider).toString(),
          );
        }),
      ),
    );
  }
}
