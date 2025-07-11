import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loads();
  }

  ValueNotifier<bool> loadingCondition = ValueNotifier(true);

  Future<void> loads() async {
    loadingCondition.value = true;
    print('It is now false');
    await Future.delayed(Duration(seconds: 8));

    print('It is now Changing to false');
    loadingCondition.value = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loadingCondition.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: loadingCondition,
              builder: (BuildContext context, circularDisplay, child) {
                return circularDisplay
                    ? CircularProgressIndicator()
                    : Icon(Icons.check_circle, color: Colors.green, size: 60);
              },
            ),
          ],
        ),
      ),
    );
  }
}
