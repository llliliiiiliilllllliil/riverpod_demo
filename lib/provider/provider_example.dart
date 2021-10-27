import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<String> helloWorldProvider = Provider((_) => 'Hello World!');

class ProviderExample extends ConsumerWidget {
  const ProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final String value = ref.watch(helloWorldProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(
        child: Text(value),
      ),
    );
  }
}
