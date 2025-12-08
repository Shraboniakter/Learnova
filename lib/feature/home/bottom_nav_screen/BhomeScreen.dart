import 'package:flutter/material.dart';

class BhomeScreen extends StatefulWidget {
  const BhomeScreen({super.key});

  @override
  State<BhomeScreen> createState() => _BhomeScreenState();
}

class _BhomeScreenState extends State<BhomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Bhome Screen"),
      ),
    );
  }
}
