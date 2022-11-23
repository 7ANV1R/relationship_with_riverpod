import 'package:all_provider/repo/stream_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProviderProvider = StreamProvider((ref) {
  final streamRepo = ref.watch(streamRepoProvider);
  return streamRepo.getStream();
});

class StreamRivProvider extends ConsumerWidget {
  const StreamRivProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamProviderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Center(
        child: streamValue.when(
          data: (data) => Center(child: Text(data.toString())),
          error: (error, stackTrace) => Text(
            error.toString(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }
}
