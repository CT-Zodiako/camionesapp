import 'package:flutter/material.dart';
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 11, 53),
      body: Center(
          child: CircularProgressIndicator(
              color: Color.fromARGB(251, 187, 134, 171))),
    );
  }
}
