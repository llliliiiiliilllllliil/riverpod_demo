import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider.autoDispose((ref) async {
  /// 延时3s
  await Future.delayed(const Duration(seconds: 3));

  /// 延时期间退出不保留结果。否则maintainState为true时，则将保留状态，下次重新进入页面时不会触发延时。
  ref.maintainState = true;
  return 'Riverpod';
});

class AutoDisposeExample2 extends StatelessWidget {
  const AutoDisposeExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDispose'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, r, _) {
            AsyncValue<String> futureProviderValue = r.watch(futureProvider);
            return futureProviderValue.when(
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
