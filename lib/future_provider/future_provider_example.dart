import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FutureProvider<String> futureProvider = FutureProvider((_) async {
  /// 延时3s
  await Future.delayed(const Duration(seconds: 3));
  return 'Riverpod';
});

class FutureProviderExample extends StatelessWidget {
  const FutureProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            AsyncValue<String> futureProviderValue = ref.watch(futureProvider);
            return futureProviderValue.when(
              loading: (_) => const CircularProgressIndicator(),
              error: (error, stack, _) =>
                  const Text('Oops, something unexpected happened'),
              data: (value) => Text(
                'Hello $value',
                style: Theme.of(context).textTheme.headline4,
              ),
            );

            /// 或
//            final String name = futureProviderValue.data?.value;
//            return Text(
//              'Hello ${name ?? '...'}',
//              style: Theme.of(context).textTheme.headline4,
//            );
          },
        ),
      ),
    );
  }
}
