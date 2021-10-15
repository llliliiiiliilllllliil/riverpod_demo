import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProviderObserver implements ProviderObserver {
  @override
  void didAddProvider(ProviderBase<dynamic, dynamic> provider, Object? value) {
    print(' ======> riverpod');
    print('add provider: $provider, value: ${value.toString()}');
    print(' <======');
  }

  @override
  void mayHaveChanged(ProviderBase<dynamic, dynamic> provider) {
    // print(' ======> riverpod');
    // print('this provider may have changed provider: $provider');
    // print(' <======');
  }

  @override
  void didUpdateProvider(
      ProviderBase<dynamic, dynamic> provider, Object? newValue) {
    print(' ======> riverpod');
    print('update provider: $provider, newValue: ${newValue.toString()}');
    print(' <======');
  }

  @override
  void didDisposeProvider(ProviderBase<dynamic, dynamic> provider) {
    print(' ======> riverpod');
    print('disposed provider: $provider');
    print(' <======');
  }
}
