import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rolebased/admin/admin.dart';
import 'package:rolebased/admin/controller/pengguna_controller.dart';
import 'package:rolebased/admin/models/pengguna_models.dart';
import 'package:rolebased/admin/pengguna/tambahEdit_pengguna.dart';

class PenggunaS extends StatefulWidget {
  const PenggunaS({super.key});

  @override
  State<PenggunaS> createState() => _PenggunaSState();
}

class _PenggunaSState extends State<PenggunaS> {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
                builder: (context) => const Admin(),
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
            icon: const Icon(
              Icons.person_add,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                child: StreamBuilder(
                  stream: _users.snapshots(),
                  builder: (context, snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child:
                            CircularProgressIndicator(color: Colors.deepPurple),
                      );
                    }

                    if (snapshots.hasData) {
                      return ListView.builder(
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot records =
                                snapshots.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Slidable(
                                startActionPane: ActionPane(
                                  motion: const StretchMotion(),
                                  children: <Widget>[
                                    SlidableAction(
                                      onPressed: ((context) {
                                        final users = model_users(
                                          id: records.id,
                                          email: records['email'],
                                          nisn_npsn: records['nisn/npsn'],
                                          rool: records['rool'],
                                        );
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TambahEditPengguna(
                                              users: users,
                                              index: index,
                                            ),
                                          ),
                                        );
                                      }),
                                      icon: Icons.edit,
                                      backgroundColor: Colors.deepPurple,
                                    ),
                                  ],
                                ),
                                endActionPane: ActionPane(
                                    motion: const StretchMotion(),
                                    children: <Widget>[
                                      SlidableAction(
                                        onPressed: ((context) {
                                          controller_pengguna().delete_users(
                                              model_users(id: records.id));
                                        }),
                                        icon: Icons.delete,
                                        backgroundColor: Colors.redAccent,
                                      ),
                                    ]),
                                child: ListTile(
                                  title: Text(records['email'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Raleway_Semibold')),
                                  subtitle: Text(records['rool'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Raleway_Semibold')),
                                  tileColor: Colors.deepPurple[200],
                                ),
                              ),
                            );
                          });
                    }
                    return const Center(
                        child: CircularProgressIndicator(
                            color: Colors.deepPurple));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
