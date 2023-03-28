import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rolebased/student/student.dart';
import 'package:rolebased/transaksi/tambahEdit_transaksi.dart';

import '../admin/controller/transaksi_controller.dart';
import '../admin/models/transaksi_models.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  final CollectionReference _transaksi =
      FirebaseFirestore.instance.collection("transaksi");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History",
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
                                  "Pembayaran",
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
