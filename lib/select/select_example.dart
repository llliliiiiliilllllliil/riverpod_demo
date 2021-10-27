import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ChangeNotifierProvider<Person> personProvider =
    ChangeNotifierProvider((_) => Person());

class Person extends ChangeNotifier {
  int _age = 0;
  int get age => _age;
  set age(int age) {
    _age = age;
    notifyListeners();
  }

  String _name = 'lin';
  String get name => _name;
  set name(String name) {
    _name = name;
    notifyListeners();
  }
}

class SelectExample extends ConsumerWidget {
  const SelectExample({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (ctx, r, _) {
                String name = r.watch(personProvider.select((p) => p.name));
                return Text(
                  'name:$name',
                );
              },
            ),
            Consumer(
              builder: (ctx, r, _) {
                int age = r.watch(personProvider.select((p) => p.age));
                return Text(
                  'age:$age',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 这里age变化时，只有对应的Text会变化。
        onPressed: () =>
            ref.read(personProvider).age = Random.secure().nextInt(100),
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
