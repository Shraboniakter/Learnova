
import 'package:flutter/material.dart';
import 'package:untitled3/Screen/LoginScreen.dart';

void main(){
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loginscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
