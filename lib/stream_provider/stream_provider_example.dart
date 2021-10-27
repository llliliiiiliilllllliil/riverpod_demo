import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StreamProvider<String> streamProvider = StreamProvider((_) async* {
  await Future.delayed(const Duration(seconds: 3));
  yield 'Riverpod';
});

class StreamProviderExample extends StatelessWidget {
  const StreamProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            AsyncValue<String> streamProviderValue = ref.watch(streamProvider);
            return streamProviderValue.when(
              loading: (_) => const CircularProgressIndicator(),
              error: (error, stack, _) =>
                  const Text('Oops, something unexpected happened'),
              data: (value) => Text(
                'Hello $value',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          },
        ),
      ),
    );
  }
}
