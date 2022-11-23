import 'package:all_provider/repo/api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProviderProvider = FutureProvider(
  (ref) async {
    final apiService = ref.watch(apiServiceProvider);
    return apiService.getSuggestion();
  },
);

class FutureRivProvider extends ConsumerWidget {
  const FutureRivProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var futureProviderResult = ref.watch(futureProviderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return ref.refresh(futureProviderProvider.future);
        },
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            futureProviderResult.when(
              data: (data) => Center(child: Text(data.activity)),
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
