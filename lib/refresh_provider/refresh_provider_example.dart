import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FutureProvider<List<String>> productsProvider = FutureProvider((_) async {
  /// 延时3s
  await Future.delayed(const Duration(seconds: 3));
  return List.generate(50, (index) => 'Item $index');
});

class RefreshProviderExample extends ConsumerWidget {
  const RefreshProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshProvider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, r, _) {
            return Container();
            // AsyncValue<List<String>> productsProviderValue =
            //     r.watch(productsProvider);
            // return productsProviderValue.when(
            //   loading: (_) => const CircularProgressIndicator(),
            //   error: (error, stack,_) =>
            //       const Text('Oops, something unexpected happened'),
            //   data: (list) => RefreshIndicator(
            //     onRefresh: () => ref.refresh(productsProvider),

            //     /// 刷新
            //     child: ListView(
            //       children: [
            //         for (final item in list) ListTile(title: Text(item)),
            //       ],
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
