import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProviderProvider = StateProvider<int>(
  (ref) => 10,
);

class StateProviderRiv extends ConsumerWidget {
  const StateProviderRiv({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              ref.watch(stateProviderProvider).toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(stateProviderProvider.notifier).update((state) => state + 1);
              },
              child: Text('Inc'),
            )
          ],
        ),
      ),
    );
  }
}
