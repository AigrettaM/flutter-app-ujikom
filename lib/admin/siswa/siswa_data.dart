import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rolebased/admin/admin.dart';
import 'package:rolebased/admin/controller/siswa_controller.dart';
import 'package:rolebased/admin/models/siswa_models.dart';
import 'package:rolebased/admin/siswa/tambahEdit_siswa.dart';

import 'package:rolebased/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Pengguna extends StatefulWidget {
  const Pengguna({super.key});

  @override
  State<Pengguna> createState() => _PenggunaState();
}

class _PenggunaState extends State<Pengguna> {
  final CollectionReference _pengguna =
      FirebaseFirestore.instance.collection("siswa");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Siswa",
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
                  builder: (context) => TambahEdit(),
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
            children: <Widget>[
              Container(
                height: 500,
                child: StreamBuilder(
                  stream: _pengguna.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple[400],
                        ),
                      );
                    }

                    if (snapshots.hasData) {
                      return ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: ((context, index) {
                          final DocumentSnapshot records =
                              snapshots.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Slidable(
                              startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      final pengguna = pengguna_model(
                                          id: records.id,
                                          name: records['nama lengkap'],
                                          rool: records['rool'],
                                          nis: records['nis'],
                                          nisn: records['nisn'],
                                          kelas: records['kelas'],
                                          jurusan: records['jurusan']);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => TambahEdit(
                                                  pengguna: pengguna,
                                                  index: index,
                                                ))),
                                      );
                                    },
                                    icon: Icons.edit,
                                    backgroundColor: Colors.deepPurple,
                                  ),
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      pengguna_controller().delete_pengguna(
                                          pengguna_model(id: records.id));
                                    },
                                    icon: Icons.delete,
                                    backgroundColor: Colors.redAccent,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                tileColor: Colors.deepPurple[200],
                                title: Text(
                                  records['nama lengkap'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Raleway_Semibold'),
                                ),
                                subtitle: Text(
                                  records['jurusan'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Raleway_Semibold'),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurple[400],
                      ),
                    );
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
