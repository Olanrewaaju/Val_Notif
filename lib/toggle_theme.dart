import 'package:flutter/material.dart';
import 'main.dart';
import 'package:basic_test4_initstate/toggle_theme.dart';

class Projexx extends StatefulWidget {
  const Projexx({super.key});

  @override
  State<Projexx> createState() => _ProjexxState();
}

class _ProjexxState extends State<Projexx> {
  void iconmovement() {
    final toggle = Toggle.of(context);
    if (toggle != null) {
      toggle.themenotifier.value = !toggle.themenotifier.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hello Tunde Adabiri', style: TextStyle(fontSize: 16)),
            ValueListenableBuilder(
              valueListenable: Toggle.of(context)!.themenotifier,
              builder: (context, value, child) {
                return IconButton(
                  onPressed: iconmovement,

                  icon: value ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [Text('Hello this state will change very soon')],
        ),
      ),
    );
  }
}
