import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamRepoProvider = Provider(
  (ref) => StreamRepo(),
);

class StreamRepo {
  Stream<int> getStream() {
    return Stream.periodic(const Duration(seconds: 1), (computationCount) => computationCount).take(20);
  }
}
