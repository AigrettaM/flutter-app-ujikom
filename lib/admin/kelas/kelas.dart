import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rolebased/admin/admin.dart';
import 'package:rolebased/admin/controller/kelas_controller.dart';
import 'package:rolebased/admin/kelas/kelas_tambah.dart';
import 'package:rolebased/admin/models/kelas_models.dart';
import 'package:rolebased/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Kelas extends StatefulWidget {
  const Kelas({super.key});

  @override
  State<Kelas> createState() => _KelasState();
}

class _KelasState extends State<Kelas> {
  final CollectionReference _kelas =
      FirebaseFirestore.instance.collection("kelas");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Kelas",
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
                  builder: (context) => KelasTambah(),
                ),
              );
            },
            icon: const Icon(
              Icons.data_array_rounded,
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
                height: 1000,
                child: StreamBuilder(
                  stream: _kelas.snapshots(),
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
                                      final kelas = kelas_model(
                                          id: records.id,
                                          kelas: records['kelas'],
                                          jurusan: records['jurusan']);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => KelasTambah(
                                                  transaksi: kelas,
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
                                      kelas_controller().delete_kelas(
                                          kelas_model(id: records.id));
                                    },
                                    icon: Icons.delete,
                                    backgroundColor: Colors.redAccent,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                tileColor: Colors.deepPurple[200],
                                title: Text(
                                  records['kelas'],
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
