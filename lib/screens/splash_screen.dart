import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen(
  //const MyApp({Key? key}) : super(key: key);
      //{required Key?  key}) : super(key: key

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Text("Loading....."),
      ),
    );
  }
}
