import 'package:basic_test4_initstate/loading.dart';
import 'package:basic_test4_initstate/toggle_theme.dart';
import 'package:flutter/material.dart';

import 'package:basic_test4_initstate/label_err_with_value_notif.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ValueNotifier<bool> themeChanger = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Toggle(
      themenotifier: themeChanger,
      child: ValueListenableBuilder(
        valueListenable: themeChanger,
        builder: (context, value, child) {
          return MaterialApp(
            home: Projexx(),
            theme: value ? ThemeData.light() : ThemeData.dark(),
            title: 'Kellogs Demo',
          );
        },
      ),
    );
  }
}

class Toggle extends InheritedWidget {
  final ValueNotifier<bool> themenotifier;

  const Toggle({Key? key, required Widget child, required this.themenotifier})
    : super(key: key, child: child);

  static Toggle? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Toggle>();
  }

  @override
  bool updateShouldNotify(Toggle oldWidget) {
    return themenotifier != oldWidget.themenotifier;
  }
}
