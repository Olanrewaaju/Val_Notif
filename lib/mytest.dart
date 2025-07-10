import 'package:flutter/material.dart';

class Mytest extends StatefulWidget {
  const Mytest({super.key});

  @override
  State<Mytest> createState() => _MytestState();
}

class _MytestState extends State<Mytest> {
  ValueNotifier<bool> emailController = ValueNotifier(true);
  final TextEditingController textedits = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(isValid);
  }

  void isValid() {
    String name = textedits.text;
    final namecondition = name.contains('@') && name.isEmpty;
    if (emailController.value != namecondition) {
      emailController.value = namecondition;
    }
  }

  void button() {
    if (emailController.value && textedits.text.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login Button Pressed')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid Details Boy')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: textedits,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: emailController,
              builder: (context, namecondition, Widget? child) {
                return namecondition
                    ? Text('')
                    : Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Miisng an @ or the sizedbox is empty',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
