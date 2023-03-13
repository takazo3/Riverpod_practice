import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Data/count_data.dart';

final titleProvider = Provider((ref) {
  return 'Riverpod';
});

final messageProvider =
    Provider((ref) => 'You have pushed the button this many times:');

final countProvider = StateProvider<int>((ref) => 0);

final countDataProvider = StateProvider<CountData>(
  (ref) => const CountData(count: 0, countUp: 0, countDown: 0),
);
