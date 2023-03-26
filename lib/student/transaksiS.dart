import 'package:flutter/material.dart';

import 'package:rolebased/student/student.dart';

class TransaksiS extends StatefulWidget {
  const TransaksiS({super.key});

  @override
  State<TransaksiS> createState() => _TransaksiSState();
}

class _TransaksiSState extends State<TransaksiS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transaksi",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway_Semibold',
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 80.0,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Student(),
              ),
            );
          },
        ),
      ),
    );
  }
}
