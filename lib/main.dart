import 'package:flutter/material.dart';

import 'package:basic_test4_initstate/label_err_with_value_notif.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Kelloggs(), title: 'Kellogs Demo');
  }
}
