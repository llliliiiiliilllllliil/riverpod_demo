import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<String> cityProvider = StateProvider((ref) => 'London');
final StateProvider<String> weatherProvider = StateProvider((ref) {
  final String city = ref.watch(cityProvider).state;
  return '$city (Sunny)';
});

class CombiningProviderExample2 extends ConsumerWidget {
  const CombiningProviderExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('CombiningProvider')),
      body: Center(
        child: Consumer(
          builder: (context, watch, _) {
            final String weather = ref.watch(weatherProvider).state;
            return Text(weather);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 修改状态
          String city = ref.read(cityProvider).state;
          if (city == 'London') {
            ref.read(cityProvider).state = "Xi'an";
          } else {
            ref.read(cityProvider).state = 'London';
          }
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
