import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rolebased/admin/models/transaksi_models.dart';

final CollectionReference _transaksi =
    FirebaseFirestore.instance.collection('transaksi');

class transaksi_controller {
  // add data to firebase
  Future add_transaksi(transaksi_model transaksi) async {
    await _transaksi.doc().set(transaksi.add_data());
  }

  // update data to firebase
  Future update_transaksi(transaksi_model transaksi) async {
    await _transaksi.doc(transaksi.id).update(transaksi.add_data());
  }

  // delete data to firebase
  Future delete_transaksi(transaksi_model transaksi) async {
    await _transaksi.doc(transaksi.id).delete();
  }

  //read data to firebase
}
