import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rolebased/drawer/header_drawer.dart';

import 'auth/login.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Petugas",
            style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Raleway_Semibold'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 80.0,
          iconTheme: const IconThemeData(color: Colors.black)),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title: const Text(
                  "Beranda",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Raleway_Semibold'),
                ),
                splashColor: Colors.deepPurple[700],
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text(
                  "Log out",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Raleway_Semibold'),
                ),
                splashColor: Colors.deepPurple[700],
                onTap: () {
                  logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
