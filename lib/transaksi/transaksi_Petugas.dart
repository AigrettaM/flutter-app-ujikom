import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rolebased/admin/admin.dart';
import 'package:rolebased/admin/controller/transaksi_controller.dart';
import 'package:rolebased/admin/models/transaksi_models.dart';
import 'package:rolebased/petugas.dart';
import 'package:rolebased/transaksi/tambahEdit_transaksi.dart';
import 'package:rolebased/main.dart';
import 'package:rolebased/transaksi/tambahEdit_transaksi_Petugas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class TransaksiP extends StatefulWidget {
  const TransaksiP({super.key});

  @override
  State<TransaksiP> createState() => _TransaksiPState();
}

class _TransaksiPState extends State<TransaksiP> {
  final CollectionReference _transaksi =
      FirebaseFirestore.instance.collection("transaksi");
  // final CollectionReference _kelas =
  //     FirebaseFirestore.instance.collection('kelas');

  // List<String> kelas_ = [];

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
                builder: (context) => const Teacher(),
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
                  builder: (context) => TransaksiTambahEditP(),
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
                  stream: _transaksi.snapshots(),
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
                                      final transaksi = transaksi_model(
                                        id: records.id,
                                        name: records['nama lengkap'],
                                        jumlah: records['jumlah'],
                                        date: records['date'],
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                TransaksiTambahEditP(
                                                  transaksi: transaksi,
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
                                      transaksi_controller().delete_transaksi(
                                          transaksi_model(id: records.id));
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
                                  records['jumlah'],
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
