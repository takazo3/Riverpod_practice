import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider((ref) {
  return 'Riverpod';
});

final messageProvider = Provider((ref) =>
  'You have pushed the button this many times:'
);

final countProvider = 
    StateProvider<int>((ref) => 0);
