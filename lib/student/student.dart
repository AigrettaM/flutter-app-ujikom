import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rolebased/drawer/header_drawer.dart';
import 'package:rolebased/student/history.dart';
import 'package:rolebased/student/transaksiS.dart';

import '../auth/login.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Student",
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
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Student(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.history, color: Colors.black),
                title: const Text(
                  "history",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Raleway_Semibold'),
                ),
                splashColor: Colors.deepPurple[700],
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const history(),
                    ),
                  );
                },
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
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransaksiS(),
                  ),
                );
              },
              splashColor: Colors.deepPurple[300],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.person,
                      size: 70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Transaksi",
                      style: TextStyle(
                          fontFamily: 'Raleway_Semibold', fontSize: 17.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const history(),
                  ),
                );
              },
              splashColor: Colors.deepPurple[300],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.person,
                      size: 70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "history",
                      style: TextStyle(
                          fontFamily: 'Raleway_Semibold', fontSize: 17.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
