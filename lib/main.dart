import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(ref.watch(titleProvider))),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(ref.watch(messageProvider)),
            Text(
              ref.watch(countProvider).toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              children: [
                FloatingActionButton(
                  onPressed: () => ref
                      .read(countProvider.state)
                      .update((state) => state + 1),
                  tooltip: 'Increment',
                  child: const Icon(CupertinoIcons.plus),
                ),
                FloatingActionButton(
                  onPressed: () => ref
                      .read(countProvider.state)
                      .update((state) => state + 1),
                  tooltip: 'Increment',
                  child: const Icon(CupertinoIcons.minus),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(countProvider.state).update((state) => state + 1),
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
