import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<String> cityProvider = Provider((ref) => 'London');
final Provider<String> countryProvider = Provider((ref) => 'England');
final Provider<Location> locationProvider = Provider((ref) => Location(ref));

class Location {
  Location(this._ref);

  final ProviderRef _ref;

  String get label {
    final city = _ref.read(cityProvider);
    final country = _ref.read(countryProvider);
    return '$city ($country)';
  }
}

class CombiningProviderExample1 extends ConsumerWidget {
  const CombiningProviderExample1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final Location location = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('CombiningProvider')),
      body: Center(
        child: Text(location.label),
      ),
    );
  }
}
