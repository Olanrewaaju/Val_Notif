import 'package:flutter/material.dart';

class Kelloggs extends StatefulWidget {
  const Kelloggs({super.key});

  @override
  State<Kelloggs> createState() => _MyAppState();
}

class _MyAppState extends State<Kelloggs> {
  String name = 'Demo-Name';

  ValueNotifier<bool> _isEmailValid = ValueNotifier(true);
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailController.addListener(emailfunction);
  }

  void emailfunction() {
    final email = _emailController.text;

    final isValid = email.contains('@') && email.isNotEmpty;

    if (_isEmailValid.value != isValid) {
      _isEmailValid.value = isValid;
    }
  }

  void button() {
    if (_isEmailValid.value && _emailController.text.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login Button Pressed')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fix errors!')));
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
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            ValueListenableBuilder<bool>(
              valueListenable: _isEmailValid,

              builder: (context, isValid, Widget? child) {
                return isValid
                    ? const SizedBox.shrink() // If valid, show nothing
                    : const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Please enter a valid email (must contain @)',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
              },
            ),
            SizedBox(height: 20),

            ElevatedButton(onPressed: button, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
