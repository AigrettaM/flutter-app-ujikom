import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Lottie.network(
            'https://assets10.lottiefiles.com/packages/lf20_pfS8uifIjD.json',
            animate: true,
          ),
        ),
      ),
    );
  }
}
