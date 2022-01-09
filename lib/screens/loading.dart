import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Scaffold(
          backgroundColor: Colors.deepPurple.shade400,
          body: Center(
            child: Image.asset(
              'assets/logo.png',
              height: 100,
              width: 100,
            ),
          )),
    );
  }
}
