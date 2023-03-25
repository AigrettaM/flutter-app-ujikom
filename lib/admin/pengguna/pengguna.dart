import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rolebased/admin/admin.dart';
import 'package:rolebased/admin/pengguna/tambahEdit_pengguna.dart';

class PenggunaS extends StatefulWidget {
  const PenggunaS({super.key});

  @override
  State<PenggunaS> createState() => _PenggunaSState();
}

class _PenggunaSState extends State<PenggunaS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data pengguna",
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
                builder: (context) => Admin(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TambahEditPengguna(),
                ),
              );
            },
            icon: Icon(
              Icons.person_add,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
