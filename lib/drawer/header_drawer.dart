import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[500],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70.0,
          ),
          const Text(
            "Haloo!",
            style: TextStyle(
                fontFamily: 'Raleway_Semibold',
                fontSize: 20.0,
                color: Colors.white),
          ),
          const Text(
            "Selamat Datang",
            style: TextStyle(
                fontFamily: 'Raleway_Semibold',
                fontSize: 16.0,
                color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
