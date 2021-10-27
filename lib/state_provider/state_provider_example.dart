import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<int> stateProvider = StateProvider((_) => 0);

class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, r, _) {
                /// 使用Consumer(ConsumerWidget的封装)，控制刷新的范围。
                int count = r.watch(stateProvider).state;
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
        /// 使用read获取counterProvider，操作state。
        onPressed: () => ref.read(stateProvider).state++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
