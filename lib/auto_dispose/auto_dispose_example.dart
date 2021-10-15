import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// the state of provider will automatically be destroyed when it is no-longer used.
final autoStateProvider = StateProvider.autoDispose((ref) {
  ref.onDispose(() {
    // you can do something before this provider dispose;
  });
  return 0;
});

class AutoDisposeExample1 extends StatelessWidget {
  const AutoDisposeExample1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDispose'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, watch, _) {
                int count = watch(autoStateProvider).state;
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(autoStateProvider).state++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
