import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rolebased/admin/pengguna.dart';

import '../auth/login.dart';
import '../drawer/header_drawer.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Admin",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Raleway_Semibold',
              fontSize: 28,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 80.0,
          iconTheme: IconThemeData(color: Colors.black)
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       logout(context);
          //     },
          //     icon: Icon(
          //       Icons.logout,
          //       color: Colors.black,
          //     ),
          //   )
          // ],
          ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title: Text(
                  "Beranda",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Raleway_Semibold'),
                ),
                splashColor: Colors.deepPurple[700],
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: Text(
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
        padding: EdgeInsets.all(10),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pengguna(),
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
                      "Pengguna",
                      style: TextStyle(
                          fontFamily: 'Raleway_Semibold', fontSize: 17.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              onTap: () {},
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
                      "Siswa",
                      style: TextStyle(
                          fontFamily: 'Raleway_Semibold', fontSize: 17.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.deepPurple[300],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.wallet_rounded,
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
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.deepPurple[300],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.data_array,
                      size: 70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Data",
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
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
